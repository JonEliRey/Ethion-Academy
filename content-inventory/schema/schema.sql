-- ============================================================================
-- Super-Intelligent Course Designer - SQLite Database Schema
-- ============================================================================
-- Version: 1.0.0
-- Created: 2025-10-01
-- Purpose: Content inventory tracking for meta-development system
-- ============================================================================

-- Enable foreign key constraints
PRAGMA foreign_keys = ON;

-- ============================================================================
-- CORE CONTENT HIERARCHY
-- ============================================================================

-- Pillars: Top-level content organization
CREATE TABLE IF NOT EXISTS Pillar (
    id TEXT PRIMARY KEY NOT NULL,
    name TEXT NOT NULL UNIQUE,
    description TEXT NOT NULL,
    status TEXT NOT NULL CHECK(status IN ('draft', 'in-review', 'approved', 'published', 'deprecated')),
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    approved_at DATETIME,
    approved_by TEXT
);

-- Learning Paths: Structured learning progressions within pillars
CREATE TABLE IF NOT EXISTS LearningPath (
    id TEXT PRIMARY KEY NOT NULL,
    pillar_id TEXT NOT NULL,
    name TEXT NOT NULL,
    description TEXT NOT NULL,
    target_audience TEXT NOT NULL, -- JSON array: ["role", "level"]
    prerequisites TEXT, -- JSON array of prerequisite IDs
    status TEXT NOT NULL CHECK(status IN ('draft', 'in-review', 'approved', 'published', 'deprecated')),
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    approved_at DATETIME,
    approved_by TEXT,
    FOREIGN KEY (pillar_id) REFERENCES Pillar(id) ON DELETE CASCADE
);

-- Courses: Grouped modules within learning paths
CREATE TABLE IF NOT EXISTS Course (
    id TEXT PRIMARY KEY NOT NULL,
    path_id TEXT NOT NULL,
    name TEXT NOT NULL,
    description TEXT NOT NULL,
    outcomes TEXT NOT NULL, -- JSON array of learning outcomes
    assessment_strategy TEXT,
    status TEXT NOT NULL CHECK(status IN ('draft', 'in-review', 'approved', 'published', 'deprecated')),
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    approved_at DATETIME,
    approved_by TEXT,
    FOREIGN KEY (path_id) REFERENCES LearningPath(id) ON DELETE CASCADE
);

-- Modules: Topic groupings within courses
CREATE TABLE IF NOT EXISTS Module (
    id TEXT PRIMARY KEY NOT NULL,
    course_id TEXT NOT NULL,
    name TEXT NOT NULL,
    description TEXT NOT NULL,
    topics TEXT NOT NULL, -- JSON array of topic strings
    status TEXT NOT NULL CHECK(status IN ('draft', 'in-review', 'approved', 'published', 'deprecated')),
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    approved_at DATETIME,
    approved_by TEXT,
    FOREIGN KEY (course_id) REFERENCES Course(id) ON DELETE CASCADE
);

-- Lessons: Individual learning units
CREATE TABLE IF NOT EXISTS Lesson (
    id TEXT PRIMARY KEY NOT NULL,
    module_id TEXT NOT NULL,
    name TEXT NOT NULL,
    objectives TEXT NOT NULL, -- JSON array of measurable objectives
    outline TEXT NOT NULL, -- JSON structured outline
    practice TEXT, -- JSON array of practice exercises
    citations TEXT, -- JSON array of source citations
    leader_lens TEXT, -- JSON: {business_outcome, decision_criteria, risks, kpis}
    status TEXT NOT NULL CHECK(status IN ('draft', 'in-review', 'approved', 'published', 'deprecated')),
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    approved_at DATETIME,
    approved_by TEXT,
    FOREIGN KEY (module_id) REFERENCES Module(id) ON DELETE CASCADE
);

-- ============================================================================
-- CONTENT ASSETS (YouTube, Blog, Academy)
-- ============================================================================

-- Content Assets: Produced content mapped to lessons
CREATE TABLE IF NOT EXISTS ContentAsset (
    id TEXT PRIMARY KEY NOT NULL,
    lesson_id TEXT NOT NULL,
    asset_type TEXT NOT NULL CHECK(asset_type IN ('youtube', 'blog', 'academy')),
    title TEXT NOT NULL,
    status TEXT NOT NULL CHECK(status IN ('brief', 'in-production', 'review', 'published', 'archived')),
    youtube_url TEXT,
    blog_url TEXT,
    cta_text TEXT, -- Call-to-action text
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    published_at DATETIME,
    FOREIGN KEY (lesson_id) REFERENCES Lesson(id) ON DELETE CASCADE
);

-- Asset Production Status: Track production stages
CREATE TABLE IF NOT EXISTS AssetProductionStatus (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    asset_id TEXT NOT NULL,
    stage TEXT NOT NULL CHECK(stage IN ('brief', 'scripted', 'recorded', 'edited', 'reviewed', 'published')),
    timestamp DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    notes TEXT,
    FOREIGN KEY (asset_id) REFERENCES ContentAsset(id) ON DELETE CASCADE
);

-- ============================================================================
-- METADATA & TAGGING
-- ============================================================================

-- Tags: Canonical taxonomy for content classification
CREATE TABLE IF NOT EXISTS Tag (
    id TEXT PRIMARY KEY NOT NULL,
    category TEXT NOT NULL CHECK(category IN ('role', 'level', 'topic', 'format', 'source_type', 'tech_stack')),
    value TEXT NOT NULL,
    description TEXT,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(category, value)
);

-- Content Tags: Many-to-many relationship for content tagging
CREATE TABLE IF NOT EXISTS ContentTag (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    content_id TEXT NOT NULL,
    content_type TEXT NOT NULL CHECK(content_type IN ('pillar', 'path', 'course', 'module', 'lesson', 'asset')),
    tag_id TEXT NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (tag_id) REFERENCES Tag(id) ON DELETE CASCADE,
    UNIQUE(content_id, content_type, tag_id)
);

-- ============================================================================
-- SOURCES & CITATIONS
-- ============================================================================

-- Sources: Official documentation and community resources
CREATE TABLE IF NOT EXISTS Source (
    id TEXT PRIMARY KEY NOT NULL,
    url TEXT NOT NULL UNIQUE,
    title TEXT NOT NULL,
    source_type TEXT NOT NULL CHECK(source_type IN ('official', 'community', 'vendor', 'academic')),
    accessed_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    last_checked DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    freshness_sla INTEGER DEFAULT 30, -- Days before considered stale
    is_active BOOLEAN NOT NULL DEFAULT 1,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Content Sources: Link content to source materials
CREATE TABLE IF NOT EXISTS ContentSource (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    content_id TEXT NOT NULL,
    content_type TEXT NOT NULL CHECK(content_type IN ('pillar', 'path', 'course', 'module', 'lesson')),
    source_id TEXT NOT NULL,
    citation_context TEXT, -- Where/how this source is used
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (source_id) REFERENCES Source(id) ON DELETE CASCADE
);

-- ============================================================================
-- DEMAND SIGNALS & UPDATE TRACKING
-- ============================================================================

-- Demand Signals: Market demand indicators
CREATE TABLE IF NOT EXISTS DemandSignal (
    id TEXT PRIMARY KEY NOT NULL,
    signal_type TEXT NOT NULL CHECK(signal_type IN ('search_volume', 'community_questions', 'job_postings', 'engagement', 'competitor')),
    value TEXT NOT NULL, -- JSON: depends on signal_type
    timestamp DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    source TEXT NOT NULL, -- e.g., "Google Trends", "Stack Overflow", "LinkedIn"
    content_id TEXT, -- Optional: link to related content
    content_type TEXT CHECK(content_type IN ('pillar', 'path', 'course', 'module', 'lesson')),
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Update Alerts: Source change notifications
CREATE TABLE IF NOT EXISTS UpdateAlert (
    id TEXT PRIMARY KEY NOT NULL,
    source_id TEXT NOT NULL,
    change_type TEXT NOT NULL CHECK(change_type IN ('version_update', 'deprecated', 'new_feature', 'breaking_change', 'docs_update')),
    description TEXT NOT NULL,
    severity TEXT NOT NULL CHECK(severity IN ('critical', 'high', 'medium', 'low')),
    affected_content_ids TEXT NOT NULL, -- JSON array of content IDs
    status TEXT NOT NULL CHECK(status IN ('new', 'acknowledged', 'in-progress', 'resolved', 'dismissed')),
    detected_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    resolved_at DATETIME,
    resolved_by TEXT,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (source_id) REFERENCES Source(id) ON DELETE CASCADE
);

-- ============================================================================
-- PREREQUISITES & RELATIONSHIPS
-- ============================================================================

-- Prerequisites: Content dependencies
CREATE TABLE IF NOT EXISTS Prerequisite (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    content_id TEXT NOT NULL,
    content_type TEXT NOT NULL CHECK(content_type IN ('path', 'course', 'module', 'lesson')),
    prerequisite_id TEXT NOT NULL,
    prerequisite_type TEXT NOT NULL CHECK(prerequisite_type IN ('path', 'course', 'module', 'lesson')),
    relationship_type TEXT NOT NULL CHECK(relationship_type IN ('required', 'recommended', 'related')),
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(content_id, content_type, prerequisite_id, prerequisite_type)
);

-- ============================================================================
-- APPROVAL TRACKING
-- ============================================================================

-- Approvals: Executive Producer decisions
CREATE TABLE IF NOT EXISTS Approval (
    id TEXT PRIMARY KEY NOT NULL,
    content_id TEXT NOT NULL,
    content_type TEXT NOT NULL CHECK(content_type IN ('pillar', 'path', 'course', 'module', 'lesson', 'asset')),
    approver TEXT NOT NULL, -- "Executive Producer" or username
    decision TEXT NOT NULL CHECK(decision IN ('approved', 'rejected', 'revision-requested')),
    comments TEXT,
    timestamp DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    previous_status TEXT,
    new_status TEXT
);

-- ============================================================================
-- AGENT SYSTEM TRACKING
-- ============================================================================

-- Agent Actions: Audit trail of agent activities
CREATE TABLE IF NOT EXISTS AgentAction (
    id TEXT PRIMARY KEY NOT NULL,
    agent_name TEXT NOT NULL CHECK(agent_name IN (
        'content-strategist', 
        'sme', 
        'scriptwriter', 
        'editor', 
        'community-manager', 
        'seo-lead', 
        'qa-reviewer', 
        'librarian', 
        'monitoring-specialist'
    )),
    action_type TEXT NOT NULL CHECK(action_type IN (
        'propose', 
        'validate', 
        'create', 
        'review', 
        'approve', 
        'reject', 
        'catalog', 
        'monitor', 
        'update'
    )),
    content_id TEXT,
    content_type TEXT CHECK(content_type IN ('pillar', 'path', 'course', 'module', 'lesson', 'asset')),
    timestamp DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    input_context TEXT, -- JSON: what the agent received
    output_deliverable TEXT, -- JSON: what the agent produced
    handoff_to TEXT, -- Next agent in workflow
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================================
-- INDEXES FOR PERFORMANCE
-- ============================================================================

-- Indexes for hierarchical queries
CREATE INDEX IF NOT EXISTS idx_learningpath_pillar ON LearningPath(pillar_id);
CREATE INDEX IF NOT EXISTS idx_course_path ON Course(path_id);
CREATE INDEX IF NOT EXISTS idx_module_course ON Module(course_id);
CREATE INDEX IF NOT EXISTS idx_lesson_module ON Lesson(module_id);
CREATE INDEX IF NOT EXISTS idx_asset_lesson ON ContentAsset(lesson_id);

-- Indexes for status queries
CREATE INDEX IF NOT EXISTS idx_pillar_status ON Pillar(status);
CREATE INDEX IF NOT EXISTS idx_path_status ON LearningPath(status);
CREATE INDEX IF NOT EXISTS idx_course_status ON Course(status);
CREATE INDEX IF NOT EXISTS idx_module_status ON Module(status);
CREATE INDEX IF NOT EXISTS idx_lesson_status ON Lesson(status);
CREATE INDEX IF NOT EXISTS idx_asset_status ON ContentAsset(status);

-- Indexes for tag queries
CREATE INDEX IF NOT EXISTS idx_contenttag_content ON ContentTag(content_id, content_type);
CREATE INDEX IF NOT EXISTS idx_contenttag_tag ON ContentTag(tag_id);
CREATE INDEX IF NOT EXISTS idx_tag_category ON Tag(category);

-- Indexes for source tracking
CREATE INDEX IF NOT EXISTS idx_contentsource_content ON ContentSource(content_id, content_type);
CREATE INDEX IF NOT EXISTS idx_contentsource_source ON ContentSource(source_id);
CREATE INDEX IF NOT EXISTS idx_source_lastchecked ON Source(last_checked);

-- Indexes for update alerts
CREATE INDEX IF NOT EXISTS idx_updatealert_source ON UpdateAlert(source_id);
CREATE INDEX IF NOT EXISTS idx_updatealert_status ON UpdateAlert(status);
CREATE INDEX IF NOT EXISTS idx_updatealert_severity ON UpdateAlert(severity);

-- Indexes for prerequisites
CREATE INDEX IF NOT EXISTS idx_prerequisite_content ON Prerequisite(content_id, content_type);
CREATE INDEX IF NOT EXISTS idx_prerequisite_prereq ON Prerequisite(prerequisite_id, prerequisite_type);

-- Indexes for agent actions
CREATE INDEX IF NOT EXISTS idx_agentaction_agent ON AgentAction(agent_name);
CREATE INDEX IF NOT EXISTS idx_agentaction_content ON AgentAction(content_id, content_type);
CREATE INDEX IF NOT EXISTS idx_agentaction_timestamp ON AgentAction(timestamp);

-- Indexes for approvals
CREATE INDEX IF NOT EXISTS idx_approval_content ON Approval(content_id, content_type);
CREATE INDEX IF NOT EXISTS idx_approval_approver ON Approval(approver);

-- ============================================================================
-- TRIGGERS FOR AUDIT TRAIL
-- ============================================================================

-- Update timestamps on Pillar modifications
CREATE TRIGGER IF NOT EXISTS pillar_update_timestamp
AFTER UPDATE ON Pillar
FOR EACH ROW
BEGIN
    UPDATE Pillar SET updated_at = CURRENT_TIMESTAMP WHERE id = NEW.id;
END;

-- Update timestamps on LearningPath modifications
CREATE TRIGGER IF NOT EXISTS learningpath_update_timestamp
AFTER UPDATE ON LearningPath
FOR EACH ROW
BEGIN
    UPDATE LearningPath SET updated_at = CURRENT_TIMESTAMP WHERE id = NEW.id;
END;

-- Update timestamps on Course modifications
CREATE TRIGGER IF NOT EXISTS course_update_timestamp
AFTER UPDATE ON Course
FOR EACH ROW
BEGIN
    UPDATE Course SET updated_at = CURRENT_TIMESTAMP WHERE id = NEW.id;
END;

-- Update timestamps on Module modifications
CREATE TRIGGER IF NOT EXISTS module_update_timestamp
AFTER UPDATE ON Module
FOR EACH ROW
BEGIN
    UPDATE Module SET updated_at = CURRENT_TIMESTAMP WHERE id = NEW.id;
END;

-- Update timestamps on Lesson modifications
CREATE TRIGGER IF NOT EXISTS lesson_update_timestamp
AFTER UPDATE ON Lesson
FOR EACH ROW
BEGIN
    UPDATE Lesson SET updated_at = CURRENT_TIMESTAMP WHERE id = NEW.id;
END;

-- Update timestamps on ContentAsset modifications
CREATE TRIGGER IF NOT EXISTS contentasset_update_timestamp
AFTER UPDATE ON ContentAsset
FOR EACH ROW
BEGIN
    UPDATE ContentAsset SET updated_at = CURRENT_TIMESTAMP WHERE id = NEW.id;
END;

-- Update timestamps on Source modifications
CREATE TRIGGER IF NOT EXISTS source_update_timestamp
AFTER UPDATE ON Source
FOR EACH ROW
BEGIN
    UPDATE Source SET updated_at = CURRENT_TIMESTAMP WHERE id = NEW.id;
END;

-- Update timestamps on UpdateAlert modifications
CREATE TRIGGER IF NOT EXISTS updatealert_update_timestamp
AFTER UPDATE ON UpdateAlert
FOR EACH ROW
BEGIN
    UPDATE UpdateAlert SET updated_at = CURRENT_TIMESTAMP WHERE id = NEW.id;
END;

-- ============================================================================
-- SCHEMA VERSION TRACKING
-- ============================================================================

CREATE TABLE IF NOT EXISTS SchemaVersion (
    version TEXT PRIMARY KEY NOT NULL,
    applied_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    description TEXT
);

-- Record initial schema version
INSERT OR IGNORE INTO SchemaVersion (version, description) 
VALUES ('1.0.0', 'Initial schema: 16 core entities with relationships, indexes, and triggers');

-- ============================================================================
-- END OF SCHEMA
-- ============================================================================
