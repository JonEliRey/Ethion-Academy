# Microsoft Data Analytics Journey – Research Notes

_Last updated: 2025-11-15_

## Objectives
- Capture quantitative + qualitative demand evidence for Excel + Power BI + Microsoft Fabric learning journey.
- Track in-flight research (search trends, job market, community signals, competitor gaps).
- Log open questions, next actions, and source URLs for easy transfer to pillar spec + SME handoff.

## Demand Evidence Backlog

### Search Trends & Interest Proxies

- **Power Query (Wikipedia pageviews):** Ranging 3.3K–4.7K monthly views Jan 2023–Oct 2024. Need to compute YoY delta (script WIP).
- **Power BI (Wikipedia pageviews):** ~1.1K–1.3K monthly views mid-2024; calculation to quantify 2023 vs 2024 uplift pending.
- **Google Trends – "Power BI vs Excel":** 2024 avg index 31.4 (≈+2% YoY) and 2025 YTD avg 50.3 (≈+60% vs 2024); spike week of 2025-11-09 at 26. Source: [Google Trends Explore](https://trends.google.com/trends/explore?date=2023-01-01%202025-11-15&q=Power%20BI%20vs%20Excel) (captured 2025-11-15).
- **Google Trends – "Power Query":** 2024 avg index 72.2 (≈+8.7% YoY) while 2025 YTD avg 71.1 (≈-1.5% vs 2024); latest weekly index 58 (2025-11-09). Source: [Google Trends Explore](https://trends.google.com/trends/explore?date=2023-01-01%202025-11-15&q=Power%20Query) (captured 2025-11-15).
- **Google Trends – "Microsoft Fabric":** 2024 avg index 21.0 (≈+138% YoY) and 2025 YTD avg 43.4 (≈+106% vs 2024); latest week 30 (2025-11-09). Source: [Google Trends Explore](https://trends.google.com/trends/explore?date=2023-01-01%202025-11-15&q=Microsoft%20Fabric) (captured 2025-11-15).
- **Google Trends – "Power BI governance":** 2024 avg index 2.5 (≈-41% YoY) yet 2025 YTD avg 28.8 (~10× growth); latest week 14 (2025-11-09). Source: [Google Trends Explore](https://trends.google.com/trends/explore?date=2023-01-01%202025-11-15&q=Power%20BI%20governance) (captured 2025-11-15).

### Job Market

- **Glassdoor (US, captured 2025-11-07):** 7,219 open roles mentioning "Excel \"Power BI\"" with salary range $78K–$155K (solutions engineers, finance analysts, etc.).
  - URL: [Glassdoor Search](https://www.glassdoor.com/Job/jobs.htm?sc.keyword=Excel%20%22Power%20BI%22&locT=N&locId=1&locKeyword=United%20States)
- **ZipRecruiter (US, captured 2025-11-07):** 909 postings mention Microsoft Fabric across BI developers, data engineers, admins; pay $70K–$130K.
  - URL: [ZipRecruiter Search](https://www.ziprecruiter.com/candidate/search?search=Microsoft%20Fabric&location=United%20States)

### Community Signals

- **Fabric Data Days (Nov 2025 campaign):** 50 days of live learning, challenges, study groups → indicates strong Fabric community activation.
  - URL: [Fabric Events Hub](https://community.fabric.microsoft.com/t5/fabric-events/bg-p/FabricEvents)
- **Power Platform School:** recurring 8-week mentoring for BAME communities to learn Power Platform + Power BI.
  - URL: [Power Platform School](https://powerplatformschool.com/)
- **Reddit r/dataengineering (Aug 2025):** 51-comment thread (score 75) on leadership forcing Power BI dashboards back into Excel exports (70–80 PDFs per slicer combo) despite Fabric deployment—highlights Excel vs Power BI mindset clash. [Thread: Treating Power BI like Excel](https://www.reddit.com/r/dataengineering/comments/1mpho6r/am_i_the_only_one_whose_company_treats_power_bi/)
- **Reddit r/PowerBI (Oct 2024):** Consultant asks “Is Microsoft Fabric the right choice?” for a 20–30 user shop still heavy in Excel; discussion covers Fabric learning curve, hidden capacity costs, and Power BI vs Excel transition pains. [Thread: Is Fabric the right choice?](https://www.reddit.com/r/PowerBI/comments/1fui87f/is_microsoft_fabric_the_right_choice/)
- **Reddit r/MicrosoftFabric (Jan 2025):** Purview governance thread (17 comments) warns about Excel exports contradicting Power BI, recommends forcing encrypted exports and using Purview to lock down Fabric semantic models. [Thread: Purview + Fabric governance tips](https://www.reddit.com/r/MicrosoftFabric/comments/1hwhc94/how_does_purview_help_with_fabric_governance/)

### Competitor Offerings & Gaps

- **Coursera – Microsoft Power BI Data Analyst Professional Certificate:** 387,834 learners; strong PL-300 prep but no Fabric/governance bridging.
  - URL: [Coursera Program](https://www.coursera.org/professional-certificates/microsoft-power-bi-data-analyst)
- **Udemy – Microsoft Power BI Desktop for Business Intelligence:** 17h, updated 2025-06, 713,357 learners; focuses on Desktop, lacks Fabric/OneLake/governance modules.
  - URL: [Udemy Course](https://www.udemy.com/course/microsoft-power-bi-up-running-with-power-bi-desktop/)
- **LinkedIn Learning – Power BI Essential Training (2024):** 3h49m, 729,374 viewers; stays within Desktop + Service basics, no Fabric/Purview or Excel governance links. [Course](https://www.linkedin.com/learning/power-bi-essential-training-2024)
- **Coursera – From Excel to Power BI:** ~3h, 290K+ enrollments; bridges Excel files into Power BI but omits Fabric, governance, or multi-tool orchestration guidance. [Course](https://www.coursera.org/learn/from-excel-to-power-bi)
- **Pluralsight – Microsoft Fabric Analytics Engineer: Plan, Implement, and Manage a Solution for Data Analytics:** 1h34m, updated 2024-06-03 for DP-600 admin tasks; covers Fabric capacity but ignores Excel/Power BI adoption and cross-tool governance storytelling. [Course](https://www.pluralsight.com/courses/microsoft-fabric-analytics-engineer-solution-data-analytics-cert)

## Open Questions / Next Actions

1. Pull Reddit or Stack Overflow stats on Excel vs Power BI confusion + Fabric learning curve.
2. Confirm governance-focused demand signals (e.g., Power BI Data Guardian blog, Purview usage stats).
3. Once evidence complete, draft pillar spec + SME handoff.
