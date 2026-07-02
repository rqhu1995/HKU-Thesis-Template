# Chapter 1 internal-consistency audit

Date: 2026-06-24

Scope: read-only audit of `Chapters/Chapter1.tex` against `Chapters/Chapter3.tex`, `Chapters/Chapter4.tex`, `Chapters/Chapter5.tex`, the frozen thesis spine, and the latest local Gemini citation-audit record.

This report does not modify Chapter 1 or any thesis source. It does not call Gemini, ChatGPT, another LLM, Zotero, or web search. It does not add, delete, move, or rewrite citations. It does not mark Chapter 1 complete. LaTeX was not compiled for this audit because the attached task explicitly required a read-only audit and explicitly said not to run the final build for this task.

## Pre-audit record

- Branch: `main`
- HEAD: `d84501a3276a0fccaa097ea3dc8d1a8f6cecf499`
- Latest Gemini audit markdown located by filename search: `tracking/citation_plans/chapter1_gemini31_citation_audit_2026-06-24.md`

Pre-audit SHA-256:

```text
ec857a69d2c82084c2bda42f9a43f0196ea08df582be31abc433d6b22ea62349  Chapters/Chapter1.tex
9fc586e89f4253f77e6a4bdfb1a952292fcf7a9faa20674cb8c1d0f65483a396  Chapters/Chapter3.tex
a7023648773dbf3a593818bc460f8594f932165e08d2e0ac37fa438df4ff9a18  Chapters/Chapter4.tex
3e3e9bd397f8867c38f942ac192d6f8948b102077acb19f3962517b74e8821b6  Chapters/Chapter5.tex
```

Pre-audit worktree status:

```text
A  .gitignore
A  .latexmkrc
A  AGENTS.md
D  Appendices/AppendixA.aux
D  Appendices/AppendixB.aux
D  Appendices/AppendixC.aux
D  Appendices/AppendixD.aux
D  Appendices/AppendixE.aux
D  Chapters/Chapter1.aux
 M Chapters/Chapter1.tex
D  Chapters/Chapter2.aux
D  Chapters/Chapter3.aux
D  Chapters/Chapter4.aux
D  Chapters/Chapter5.aux
D  Chapters/Chapter6.aux
D  main.aux
D  main.bbl
D  main.bbl-SAVE-ERROR
D  main.bcf
D  main.bcf-SAVE-ERROR
D  main.blg
D  main.fdb_latexmk
D  main.fls
D  main.lof
D  main.log
D  main.lot
D  main.out
 M main.pdf
D  main.run.xml
 M main.tex
D  main.toc
D  main.xdv
 M thesis.bib
R  HKU_THESIS_TEMPLATE_AUDIT.md -> tracking/archive/HKU_THESIS_TEMPLATE_AUDIT_2026-06-17.md
AM tracking/citation_plans/citation_plan_chapter1_2026-06-23.md
A  tracking/daily_log.md
A  tracking/issue_register.yml
A  tracking/thesis_spine_2026-06-23.md
A  tracking/tracker.xlsx
A  tracking/tracker_state.yml
?? tracking/archive/PhD_thesis_sprint_tracker_2026-06-24_1500_replan.xlsx
?? tracking/citation_plans/chapter1_gemini31_citation_audit_2026-06-24.md
```

## Method

1. Read Chapter 1 with line numbers.
2. Read Chapters 3-5 with line numbers around UDF, EUDF, ATS, EATS, CFRS, truck/repairer, time-budget, carbon-emission, station-budget, and cost-effectiveness claims.
3. Read the frozen thesis spine and the latest Gemini citation audit markdown.
4. Split Chapter 1 multi-claim sentences into separate audit items where needed.
5. Classify each claim using only: `exactly supported`, `partially supported`, `contradicted`, `not found`, or `ambiguous`.

## Main audit table

| ID | Chapter 1 精确原句 | Chapter 1 行号 | 涉及章节/方法 | 正式来源文件与行号 | 来源中的精确支持文本 | 判定 | 严重程度 | 后续动作类别 |
|---|---|---:|---|---|---|---|---|---|
| IC-01 | In this setting, the User Dissatisfaction Function (UDF) represents the expected penalty due to user abandonments as a function of the initial station inventory, reflecting the need to meet fluctuating demand for bicycles and vacant lockers \citep{ravivOptimalInventoryManagement2013,ravivStaticRepositioningBikesharing2013}. | 13 | UDF | `Chapters/Chapter3.tex:11`, `Chapters/Chapter3.tex:15` | "The user dissatisfaction function represents the expected shortage of bikes and docks incurred by station users as a function of the station's inventory after repositioning is carried out"; "measures the expected number of failed rentals and returns over the planning horizon as a function of the station's inventory" | exactly supported | P2 | keep |
| IC-02 | When usable and broken bicycles coexist, the concrete function used in this thesis is the Extended User Dissatisfaction Function (EUDF), which evaluates user dissatisfaction as a function of both usable and unusable bicycle inventories \citep{kaspiBikesharingSystemsUser2017}. | 15 | EUDF | `Chapters/Chapter5.tex:156-160` | "the EUDF value $F_i(p_i,b_i)$ represents the weighted expected user dissatisfaction at station $i$ over a day, given that $p_i$ usable bikes and $b_i$ broken bikes are present" | exactly supported | P2 | keep |
| IC-03 | Maintenance and repair activities therefore interact with repositioning decisions: the operator may need to move usable bicycles, collect broken bicycles, repair them on site, or combine these actions under limited time and resource budgets \citep{wangStaticGreenRepositioning2018,jinSimulationFrameworkOptimizing2022,huRepositioningBikeSharing2025}. | 15 | Chapter 4/5 resource limits | `Chapters/Chapter4.tex:17-24`, `Chapters/Chapter4.tex:834-932`, `Chapters/Chapter5.tex:25-31` | "within a given time budget"; "within the same time budget"; "station repairing budget"; "station (un)loading budget"; "operate within the same time budget" | partially supported | P1 | revise |
| IC-04 | Static bike repositioning jointly determines station-level bicycle movements and vehicle routes, and the search space grows rapidly with the numbers of stations and vehicles. | 19 | Chapter 3 scalability | `Chapters/Chapter3.tex:3-5`, `Chapters/Chapter3.tex:247-249`, `Chapters/Chapter3.tex:863` | "aim is to improve the scalability"; "Exact computation...requires solving a single-vehicle BRP per cluster, which is impractical"; "making population-based search tractable on city-scale instances" | exactly supported | P2 | keep |
| IC-05 | Existing approaches often use geographic, inventory, service-feasibility, or approximate routing-cost information in their clustering or partitioning stages \citep{forma3stepMathHeuristic2015,schuijbroekInventoryRebalancingVehicle2017}. | 19 | Chapter 3 prior methods | `Chapters/Chapter3.tex:231`, `Chapters/Chapter3.tex:237`, `tracking/citation_plans/chapter1_gemini31_citation_audit_2026-06-24.md:46-47` | "approximate the within-cluster routing time as a maximum spanning star"; "also incorporates UDF into clustering"; Gemini C10: "Existing clustering/decomposition approaches use geographic, inventory, service-feasibility, or routing-cost information" | partially supported | P2 | revise |
| IC-06 | This motivates the first challenge of the thesis: embedding estimated UDF reduction and per-vehicle routing-time feasibility directly into clustering, so that the decomposition stage is aligned with both service improvement and route feasibility. | 19 | Chapter 3/RQ1 | `Chapters/Chapter3.tex:114`, `Chapters/Chapter3.tex:227-237`, `tracking/thesis_spine_2026-06-23.md:19-27` | "maximizing the total estimated UDF reduction subject to a per-cluster time budget"; "UDF is evaluated at the estimated inventory"; "routing feasibility enter the clustering decision directly" | exactly supported | P2 | keep |
| IC-07 | Broken bicycles change the station state because they cannot serve rental demand and may consume locker capacity \citep{kaspiBikesharingSystemsUser2017}. | 21 | Chapter 4/5 broken-bike state | `Chapters/Chapter5.tex:19-23`, `Chapters/Chapter5.tex:442-452` | "broken bikes cannot be rented and continue to occupy docks until they are collected or repaired"; "Broken-bike inventory decreases when trucks collect broken bikes or repairers repair broken bikes on site" | exactly supported | P2 | keep |
| IC-08 | This motivates the second challenge: coordinating usable-bike repositioning, broken-bike collection, and repairer-based on-site repair in one static planning problem. | 21 | Chapter 4/RQ2 | `Chapters/Chapter4.tex:3-5`, `Chapters/Chapter4.tex:17-24`, `tracking/thesis_spine_2026-06-23.md:31-42` | "relocating usable and broken bikes by trucks"; "repairers who visit stations and repair broken bikes directly"; "two interacting routing decisions and station-level quantity decisions" | exactly supported | P2 | keep |
| IC-09 | When broken-bike collection and on-site repair are introduced, candidate clusters can no longer be evaluated only through one-dimensional usable-bike inventory changes. | 23 | Chapter 5/EATS | `Chapters/Chapter5.tex:602-617`, `Chapters/Chapter5.tex:751-756` | "three types: a usable-bike transfer...a broken-bike pickup...and an on-site repair"; "aggregate bivariate state changes"; "jointly bounded by the available broken bikes" | exactly supported | P2 | keep |
| IC-10 | The relevant planning setting must account for bivariate station states \citep{kaspiBikesharingSystemsUser2017}, usable-bike transfers and broken-bike collection \citep{wangStaticGreenRepositioning2018}, and separate truck and repairer resources \citep{huRepositioningBikeSharing2025}. | 23 | Chapter 5 integrated state/resources | `Chapters/Chapter5.tex:156-168`, `Chapters/Chapter5.tex:609-617`, `Chapters/Chapter5.tex:662-687` | "given that $p_i$ usable bikes and $b_i$ broken bikes are present"; "usable-bike transfer"; "broken-bike pickup"; "on-site repair"; "separates truck work and repairer work into two parallel streams" | exactly supported | P2 | keep |
| IC-11 | Chapter 3 develops the methodological foundation by studying UDF-aware decomposition for the multi-vehicle static bike repositioning problem. | 25 | Chapter 3 progression | `Chapters/Chapter3.tex:3-5`, `tracking/thesis_spine_2026-06-23.md:61-67` | "develops a user-dissatisfaction-aware cluster-first, route-second decomposition framework"; "methodological foundation" | exactly supported | P2 | keep |
| IC-12 | Chapter 4 develops the operational pillar by modelling integrated usable-bike repositioning, broken-bike collection, and on-site repair. | 25 | Chapter 4 progression | `Chapters/Chapter4.tex:3-5`, `tracking/thesis_spine_2026-06-23.md:69-75` | "static bike repositioning problem with broken bikes and on-site repair"; "operational pillar" | exactly supported | P2 | keep |
| IC-13 | Chapter 5 provides the methodological and operational synthesis by extending the decomposition principle to large-scale static bike repositioning with bivariate EUDF changes and separate truck and repairer budgets. | 25 | Chapter 5 synthesis, except budget phrase | `Chapters/Chapter5.tex:3-5`, `Chapters/Chapter5.tex:598-607`, `tracking/thesis_spine_2026-06-23.md:77-83` | "combines the operational features introduced in Chapter 4 with the scalability motivation of Chapter 3"; "cluster value is the resulting EUDF reduction" | exactly supported | P2 | keep |
| IC-14 | Chapter 5 provides the methodological and operational synthesis by extending the decomposition principle to large-scale static bike repositioning with bivariate EUDF changes and separate truck and repairer budgets. | 25 | Chapter 5 budget wording | `Chapters/Chapter5.tex:25-26`, `Chapters/Chapter5.tex:662-710` | "A fleet of repositioning trucks and a set of repairers operate within the same time budget"; "The cluster time proxy is $\widehat T(B)=\max\{\widehat T_T(B),\widehat T_R(B)\}"; "$\widehat T(B)\le T$" | contradicted | P0 | requires author decision |
| IC-15 | How can a cluster-first, route-second framework for the multi-vehicle static bike repositioning problem incorporate estimated UDF reduction and per-vehicle routing-time feasibility directly into its clustering stage? | 30 | RQ1/Chapter 3 | `Chapters/Chapter3.tex:114`, `Chapters/Chapter3.tex:231-237`, `tracking/thesis_spine_2026-06-23.md:17-27` | "maximizing the total estimated UDF reduction subject to a per-cluster time budget"; "routing feasibility enter the clustering decision directly" | exactly supported | P2 | keep |
| IC-16 | How can a static bike repositioning problem that jointly coordinates truck-based usable-bike repositioning and broken-bike collection with repairer-based on-site repair be modeled and solved efficiently? | 31 | RQ2/Chapter 4 | `Chapters/Chapter4.tex:3-5`, `Chapters/Chapter4.tex:623-627`, `tracking/thesis_spine_2026-06-23.md:29-42` | "two interacting routing decisions and station-level quantity decisions"; "HGSADC-SBC"; "determine loading, unloading, and repairing quantities" | exactly supported | P2 | keep |
| IC-17 | How can the UDF-aware cluster-first, route-second principle developed for usable-bike repositioning be extended to large-scale static bike repositioning problems with broken bikes and on-site repair, where cluster evaluation must account for bivariate EUDF changes and separate truck and repairer budgets? | 32 | RQ3/Chapter 5 extension, except budget phrase | `Chapters/Chapter5.tex:3-5`, `Chapters/Chapter5.tex:602-617`, `tracking/thesis_spine_2026-06-23.md:44-57` | "extends the cluster-first, route-second idea"; "bivariate state changes"; "usable-bike transfer"; "broken-bike pickup"; "on-site repair" | exactly supported | P2 | keep |
| IC-18 | How can the UDF-aware cluster-first, route-second principle developed for usable-bike repositioning be extended to large-scale static bike repositioning problems with broken bikes and on-site repair, where cluster evaluation must account for bivariate EUDF changes and separate truck and repairer budgets? | 32 | RQ3 budget wording | `Chapters/Chapter5.tex:25-26`, `Chapters/Chapter5.tex:662-710` | "operate within the same time budget"; "$\widehat T(B)=\max\{\widehat T_T(B),\widehat T_R(B)\}"; "$\widehat T(B)\le T$" | contradicted | P0 | requires author decision |
| IC-19 | Corresponding to RQ1, the first objective is to develop a UDF-aware cluster-first, route-second framework for the multi-vehicle static bike repositioning problem. | 35 | Objective 1 | `tracking/thesis_spine_2026-06-23.md:95-98`, `Chapters/Chapter3.tex:3-5` | "To develop a UDF-aware cluster-first, route-second framework"; "develops a user-dissatisfaction-aware cluster-first, route-second decomposition framework" | exactly supported | P2 | keep |
| IC-20 | Corresponding to RQ2, the second objective is to formulate and solve an integrated static bike repositioning problem that coordinates truck-based usable-bike repositioning and broken-bike collection with repairer-based on-site repair. | 37 | Objective 2 | `tracking/thesis_spine_2026-06-23.md:99-102`, `Chapters/Chapter4.tex:3-5` | "To formulate and solve an integrated static bike repositioning problem"; "broken bikes and on-site repair" | exactly supported | P2 | keep |
| IC-21 | Corresponding to RQ3, the third objective is to extend the UDF-aware decomposition principle to an EUDF-aware large-scale framework. | 39 | Objective 3 extension | `tracking/thesis_spine_2026-06-23.md:103-105`, `Chapters/Chapter5.tex:3-5` | "extend the UDF-aware decomposition methodology to large-scale problems with usable and broken bikes"; "EUDF-aware cluster-first, route-second framework" | exactly supported | P2 | keep |
| IC-22 | This objective synthesizes the methodological direction of Chapter 3 and the operational direction of Chapter 4 by evaluating candidate clusters through bivariate EUDF changes under separate truck and repairer budgets. | 39 | Objective 3 budget wording | `Chapters/Chapter5.tex:25-26`, `Chapters/Chapter5.tex:662-710` | "operate within the same time budget"; "The time proxy separates truck work and repairer work into two parallel streams"; "$\widehat T(B)\le T$" | contradicted | P0 | requires author decision |
| IC-23 | The first contribution is UDF-aware decomposition for static bike repositioning. | 43 | Contribution 1 | `tracking/thesis_spine_2026-06-23.md:109-113`, `Chapters/Chapter3.tex:110-114` | "Contribution 1: UDF-aware decomposition"; "UDF-aware CFRS framework" | exactly supported | P2 | keep |
| IC-24 | Activated Transfer Selection (ATS) is developed to estimate time-feasible bicycle transfers and their associated UDF reduction within candidate clusters, and Hybrid Genetic Search for UDF-aware Clustering (HGS-UC) is developed to solve the resulting clustering problem on large station networks. | 43 | ATS/HGS-UC | `Chapters/Chapter3.tex:247-249`, `Chapters/Chapter3.tex:863` | "ATS procedure, which estimates a time-feasible transfer set for each cluster"; "we develop HGS-UC, a hybrid genetic search tailored to the clustering model" | exactly supported | P2 | keep |
| IC-25 | A time-indexed mixed-integer linear programming formulation and HGSADC-SBC, which combines Hybrid Genetic Search with Adaptive Diversity Control and a Station-Budget-Constrained heuristic, are developed for this setting. | 45 | Chapter 4 MILP/HGSADC-SBC/SBC | `Chapters/Chapter4.tex:623-627`, `Chapters/Chapter4.tex:834-842`, `Chapters/Chapter4.tex:945-953` | "HGSADC-SBC"; "Station-Budget-Constrained (SBC) heuristic"; "allocates truck (un)loading time and repairer repairing time at stations" | exactly supported | P2 | keep |
| IC-26 | Chapter 4 also examines the conditions affecting the cost-effectiveness of introducing on-site repairers and includes truck carbon emissions in the objective. | 45 | Chapter 4 repairer cost-effectiveness | `Chapters/Chapter4.tex:1624-1659`, `Chapters/Chapter4.tex:1668-1684` | "analyze the cost-effectiveness of involving a repairer under different repair times and broken bike quantities"; "cost-effectiveness ratio decreases"; "cost of employing a repairer outweighs the benefits" | exactly supported | P2 | keep |
| IC-27 | Chapter 4 also examines the conditions affecting the cost-effectiveness of introducing on-site repairers and includes truck carbon emissions in the objective. | 45 | Chapter 4 carbon emissions | `Chapters/Chapter4.tex:38-48`, `Chapters/Chapter4.tex:492-493`, `tracking/thesis_spine_2026-06-23.md:141` | "The CO2 emissions of the repositioning trucks"; "minimize the sum of the penalty cost of the total user dissatisfaction...and the cost of the total CO2 emissions of all the trucks"; "Truck carbon emissions are additionally considered in...Chapter 4" | exactly supported | P2 | keep |
| IC-28 | The thesis develops Extended Activated Transfer Selection (EATS) to estimate EUDF reduction within candidate clusters under separate truck and repairer budgets, and Hybrid Genetic Search for Extended-UDF Clustering (HGS-EUC) to solve the resulting station-partitioning problem. | 47 | EATS/HGS-EUC, except budget phrase | `Chapters/Chapter5.tex:554-557`, `Chapters/Chapter5.tex:598-607`, `Chapters/Chapter5.tex:760-766` | "Extended Activated Transfer Selection (EATS), a fast surrogate that estimates the EUDF reduction obtainable inside each cluster"; "HGS-EUC is a hybrid genetic search for EUDF-guided clustering" | exactly supported | P2 | keep |
| IC-29 | The thesis develops Extended Activated Transfer Selection (EATS) to estimate EUDF reduction within candidate clusters under separate truck and repairer budgets, and Hybrid Genetic Search for Extended-UDF Clustering (HGS-EUC) to solve the resulting station-partitioning problem. | 47 | Chapter 5 budget wording | `Chapters/Chapter5.tex:25-26`, `Chapters/Chapter5.tex:662-710` | "operate within the same time budget"; "$\widehat T(B)=\max\{\widehat T_T(B),\widehat T_R(B)\}"; "$\widehat T(B)\le T$" | contradicted | P0 | requires author decision |
| IC-30 | This contribution does not treat Chapter 5 as a simple replacement of UDF by EUDF. | 47 | Chapter 5 novelty guardrail | `tracking/thesis_spine_2026-06-23.md:207-212`, `Chapters/Chapter5.tex:3-5` | "Do not describe Chapter 5 as merely replacing the UDF with the EUDF"; "combines the operational features introduced in Chapter 4 with the scalability motivation of Chapter 3" | ambiguous | P1 | requires author decision |
| IC-31 | The thesis focuses on station-based bike-sharing systems and static or off-peak planning. It considers multi-vehicle truck operations for usable-bike repositioning and broken-bike collection, together with independently routed repairers who perform on-site repairs. Service outcomes are evaluated using the UDF or EUDF, while truck carbon emissions are additionally considered in Chapter 4. The methodological scope includes mixed-integer linear programming, CFRS decomposition, constructive heuristics, and hybrid genetic search. Dynamic repositioning, pricing incentives, station-location design, and demand forecasting are outside the main scope of the thesis. | 49 | Scope | `tracking/thesis_spine_2026-06-23.md:127-141`, `Chapters/Chapter3.tex:3-5`, `Chapters/Chapter4.tex:3-5`, `Chapters/Chapter5.tex:3-5` | "static repositioning operations"; "UDF or EUDF"; "Truck carbon emissions are additionally considered...Chapter 4"; "mixed-integer programming formulations, cluster-first, route-second decomposition, constructive heuristics, and hybrid genetic search" | exactly supported | P2 | keep |
| IC-32 | Chapter 3 develops the methodological foundation of the thesis through a UDF-aware cluster-first, route-second framework for the multi-vehicle static bike repositioning problem. It formulates the clustering stage to account for estimated UDF reduction and routing-time feasibility, develops ATS to evaluate candidate clusters, and develops HGS-UC to solve the large-scale clustering problem. The chapter shows how user-dissatisfaction-based service-level evaluation can be embedded in the station-partitioning stage rather than used only after routes have been generated. | 53 | Chapter 3 outline, first two claims | `tracking/thesis_spine_2026-06-23.md:149`, `Chapters/Chapter3.tex:114`, `Chapters/Chapter3.tex:247-249`, `Chapters/Chapter3.tex:863` | "formulates the clustering stage to account jointly for estimated UDF reduction and routing-time feasibility"; "ATS procedure"; "HGS-UC" | exactly supported | P2 | keep |
| IC-33 | Chapter 3 develops the methodological foundation of the thesis through a UDF-aware cluster-first, route-second framework for the multi-vehicle static bike repositioning problem. It formulates the clustering stage to account for estimated UDF reduction and routing-time feasibility, develops ATS to evaluate candidate clusters, and develops HGS-UC to solve the large-scale clustering problem. The chapter shows how user-dissatisfaction-based service-level evaluation can be embedded in the station-partitioning stage rather than used only after routes have been generated. | 53 | Chapter 3 outline, "rather than used only after routes" clause | `Chapters/Chapter3.tex:114`, `Chapters/Chapter3.tex:237`, `Chapters/Chapter3.tex:243`, `Chapters/Chapter3.tex:863` | "routing phase...solved from scratch"; "routing feasibility enter the clustering decision directly"; "ATS replaces an exact single-vehicle BRP solve" | partially supported | P1 | revise |
| IC-34 | Chapter 4 develops the operational pillar by studying integrated usable-bike repositioning, broken-bike collection, and on-site repair. It presents a time-indexed mixed-integer linear programming formulation for coordinating truck routes, repairer routes, station-level bike-handling quantities, and repair quantities. It then develops HGSADC-SBC by combining Hybrid Genetic Search with Adaptive Diversity Control and a Station-Budget-Constrained heuristic. The numerical analyses examine the operational conditions under which introducing on-site repairers is cost-effective. | 55 | Chapter 4 outline | `tracking/thesis_spine_2026-06-23.md:151`, `Chapters/Chapter4.tex:3-5`, `Chapters/Chapter4.tex:623-627`, `Chapters/Chapter4.tex:1261-1266`, `Chapters/Chapter4.tex:1624-1659` | "integrated static bike repositioning problem"; "HGSADC-SBC"; "focuses on the impact of varying repair times on the cost-effectiveness of including a repairer" | exactly supported | P2 | keep |
| IC-35 | Chapter 5 provides the methodological and operational synthesis by extending the Chapter 3 decomposition principle to the Chapter 4 operational setting. It develops EATS to estimate cluster-level EUDF reduction under separate truck and repairer budgets and HGS-EUC to solve the resulting large-scale station-partitioning problem. The chapter therefore studies how EUDF-aware decomposition can be used for large-scale static bike repositioning with usable bicycles, broken bicycles, trucks, and repairers. | 57 | Chapter 5 outline, non-budget claims | `tracking/thesis_spine_2026-06-23.md:153`, `Chapters/Chapter5.tex:3-5`, `Chapters/Chapter5.tex:554-557`, `Chapters/Chapter5.tex:760-766`, `Chapters/Chapter5.tex:2054-2063` | "combines the decomposition methodology of Chapter 3 with the integrated operational setting of Chapter 4"; "EATS"; "HGS-EUC"; "trucks move usable bikes and collect broken bikes, while repairers visit stations" | exactly supported | P2 | keep |
| IC-36 | Chapter 5 provides the methodological and operational synthesis by extending the Chapter 3 decomposition principle to the Chapter 4 operational setting. It develops EATS to estimate cluster-level EUDF reduction under separate truck and repairer budgets and HGS-EUC to solve the resulting large-scale station-partitioning problem. The chapter therefore studies how EUDF-aware decomposition can be used for large-scale static bike repositioning with usable bicycles, broken bicycles, trucks, and repairers. | 57 | Chapter 5 outline budget wording | `Chapters/Chapter5.tex:25-26`, `Chapters/Chapter5.tex:662-710` | "operate within the same time budget"; "$\widehat T(B)=\max\{\widehat T_T(B),\widehat T_R(B)\}"; "$\widehat T(B)\le T$" | contradicted | P0 | requires author decision |

Verdict counts over the 36 split items:

- `exactly supported`: 27
- `partially supported`: 3
- `contradicted`: 5
- `ambiguous`: 1
- `not found`: 0

## Required P0/P1 check coverage

| Check | Coverage result |
|---|---|
| A. Chapter 5 separate truck and repairer budgets | Covered in IC-14, IC-18, IC-22, IC-29, IC-36. This is the only P0 issue. |
| B. Chapter 4 truck/repairer time constraints | Covered in IC-08, IC-25, IC-34. Supported; Chapter 4 uses the same time budget for trucks and repairers. |
| C. Repairer staffing and cost-effectiveness | Covered in IC-26. Supported as an experiment/indicator, not as an endogenous staffing-cost term in the objective. |
| D. Carbon-emission scope | Covered in IC-27 and IC-31. Supported: Chapter 4 includes truck emissions; Chapter 5 explicitly removes emission terms. |
| E. UDF/EUDF evaluation versus clustering reduction | Covered in IC-01, IC-02, IC-06, IC-09, IC-24, IC-28, IC-32. Supported. |
| F. Chapter 3 novelty/earlier methods | Covered in IC-05, IC-06, IC-30, IC-33. No unsupported priority claim found, but IC-33 is partially supported and should be tightened later. |
| G. ATS/EATS/algorithm names | Covered in IC-24, IC-25, IC-28, IC-32, IC-34, IC-35. Supported. |
| H. Station-budget concept | Covered in IC-25 and IC-34. Supported as station-level time allocation through SBC/BCRF, not as a system-wide budget. |
| I. Inventory coupling | Covered in IC-09 and IC-10. Supported by bivariate EUDF states and the joint bound on broken-bike pickup and repair. |
| J. Chapter 3-4-5 progression | Covered in IC-11, IC-12, IC-13, IC-35. Supported except for the repeated Chapter 5 budget wording. |
| K. Objectives/contributions/outline | Covered in IC-15 through IC-36. Supported except for the repeated Chapter 5 budget wording and the internal-tone sentence in IC-30. |

## P0/P1/P2 findings

### P0

| Finding | Evidence | Rows | Action |
|---|---|---|---|
| Chapter 1 repeatedly says Chapter 5/EATS uses "separate truck and repairer budgets", but Chapter 5 uses one shared time budget and a max of separate truck/repairer time proxies. | Chapter 5 says trucks and repairers "operate within the same time budget" (`Chapters/Chapter5.tex:25-26`), defines `\widehat T(B)=\max\{\widehat T_T(B),\widehat T_R(B)\}` (`Chapters/Chapter5.tex:662-670`), and enforces `\widehat T(B)\le T` (`Chapters/Chapter5.tex:706-710`). | IC-14, IC-18, IC-22, IC-29, IC-36 | requires author decision |

### P1

| Finding | Evidence | Rows | Action |
|---|---|---|---|
| The line-15 phrase "limited time and resource budgets" is broader than the formal sources. The formal sources support time budgets, capacity/resource constraints, and station-level SBC budgets, but not a generic "resource budgets" formulation unless this is only informal wording. | Chapter 4 and Chapter 5 support time budgets and station-level budgets, not separate or generic resource-budget decision variables. | IC-03 | revise |
| The Chapter 1 sentence "This contribution does not treat Chapter 5 as a simple replacement of UDF by EUDF" is traceable to the internal thesis-spine guardrail, but it reads like internal/reviewer-response prose rather than a normal thesis contribution sentence. | The thesis spine labels this wording as "Internal novelty guardrails - not thesis text" (`tracking/thesis_spine_2026-06-23.md:186-215`). | IC-30 | requires author decision |
| The Chapter 3 outline clause "rather than used only after routes have been generated" is only partially supported by Chapter 3. Chapter 3 supports embedding UDF reduction in clustering and solving routing afterward, but the phrase may overstate the contrast with previous approaches. | Chapter 3 says UDF and routing feasibility enter clustering directly, but also notes that Forma already incorporated UDF into clustering (`Chapters/Chapter3.tex:237`). | IC-33 | revise |

### P2

| Finding | Evidence | Rows | Action |
|---|---|---|---|
| Prior-method wording in line 19 is internally plausible and Gemini-audited, but Chapter 3 itself only provides selected examples. | Gemini C10 supports the citation choice, while Chapter 3 provides specific examples rather than a complete literature census. | IC-05 | revise |
| Chapter 1 has minor terminology/style inconsistencies that do not change technical meaning. | "on site" appears at line 15, while "on-site" appears at lines 21, 23, 25, 31, 32, 37, 45, 49, 51, and 55. "Modelling/modelling" appears at lines 5, 13, and 25, while "modeled" appears at line 31. | Structure/language section | revise |

## Chapter 1 structure and language checks

- Current structure: 3 sections only.
  - `\section{Background of research}` at line 3.
  - `\section{Motivations and objectives}` at line 17.
  - `\section{Scope and outline of the thesis}` at line 41.
- No `\subsection` commands in Chapter 1.
- No `\label` commands in Chapter 1.
- Required content blocks are present: background, motivations, RQs, objectives, contributions, scope, and chapter outline.
- No matches found for: `this paper`, `novel`, `first time`, `for the first time`, `first study`, `robust`, `comprehensive`, `highly efficient`, or `significant`.
- The only internal/reviewer-response-style wording found is line 47: "This contribution does not treat Chapter 5 as a simple replacement of UDF by EUDF."
- The current first paragraph is no longer uncited: line 5 contains citations to `alvarez-valdesOptimizingLevelService2016`, `demaioBikesharingHistoryImpacts2009`, `nathModellingMethodsPlanning2019`, and `ravivOptimalInventoryManagement2013`.

## Term consistency statistics and positions

| Term group | Count/positions in Chapter 1 | Assessment |
|---|---|---|
| `UDF` | 21 occurrences: lines 13, 19, 23, 25, 30, 32, 35, 39, 43, 47, 49, 53 | Heavy but expected; used for Chapter 3 and the general service-evaluation frame. |
| `EUDF` | 12 occurrences: lines 15, 23, 25, 32, 39, 47, 49, 57 | Heavy but expected; used for Chapter 5 and the bivariate extension. |
| `truck` / `trucks` | 17 occurrences: lines 21, 23, 25, 31, 32, 37, 39, 45, 47, 49, 55, 57 | Consistent with Chapters 4-5. |
| `repairer` / `repairers` | 18 occurrences: lines 21, 23, 25, 31, 32, 37, 39, 45, 47, 49, 55, 57 | Consistent with Chapters 4-5. |
| `budget` / `budgets` | 8 occurrences: lines 15, 25, 32, 39, 45, 47, 55, 57 | High-risk group. Five Chapter 5 uses say "separate truck and repairer budgets" and conflict with Chapter 5's single shared `T`. |
| `broken` | 26 occurrences: lines 15, 21, 23, 25, 31, 32, 37, 45, 49, 51, 55, 57 | Consistent with Chapters 4-5. |
| `unusable` | 8 occurrences: line 15 only | Acceptable in background/EUDF definition, but Chapter 4/5 formal terms are mostly `broken bikes`. |
| `on-site` / `on site` / `onsite` | `on-site`: lines 21, 23, 25, 31, 32, 37, 45, 49, 51, 55; `on site`: line 15; `onsite`: 0 in Chapter 1 | Minor inconsistency: prefer one form in thesis prose. |
| `locker` / `dock` | `locker(s)`: lines 5, 7, 9, 13, 15, 21; `dock(s)`: 0 | Internally consistent with Chapter 1's wording; Chapter 3 source uses "docks" at line 11, so this is a terminology choice rather than a contradiction. |
| `modelling` / `modeling` / `modeled` | `Modelling`: line 5; `modelling`: lines 13, 25; `modeled`: line 31 | Minor British/American spelling mix. |
| `repositioning` / `rebalancing` | `repositioning`: frequent, lines 7, 11, 13, 15, 19, 21, 23, 25, 30-32, 35, 37, 43, 45, 49, 51, 53, 55, 57; `rebalancing`: lines 19, 21 | Mostly consistent; `rebalancing` appears in cited/operational context and does not create a contradiction. |
| `carbon` / `emission(s)` | lines 45 and 49 | Correctly scoped to Chapter 4. |
| Algorithm names | `ATS`: lines 43, 53; `HGS-UC`: lines 43, 53; `HGSADC-SBC`: lines 45, 55; `EATS`: lines 47, 57; `HGS-EUC`: lines 47, 57; `CFRS`: line 49 | Names align with Chapters 3-5. |

## Gemini audit synchronization

Latest file checked: `tracking/citation_plans/chapter1_gemini31_citation_audit_2026-06-24.md`.

| Gemini ID | Gemini/audit action | Current Chapter 1 status | Sync verdict |
|---|---|---|---|
| C1 | Deployment/short-trip/public-transit framing kept with closer citations. | Reflected at line 5. | synced |
| C2 | Broader "spatially distributed inventory system" wording removed; rent/return and station-state claims kept. | Reflected at line 7. | synced |
| C3 | Demand-imbalance and empty/full-station claims kept. | Reflected at line 9. | synced |
| C4 | Dynamic-repositioning contrast removed. | Chapter 1 now says dynamic repositioning is outside scope only at line 49. | synced |
| C5 | UDF sentence narrowed to expected penalty and initial station inventory. | Reflected at line 13. | synced |
| C6 | Unusable-bike occurrence/incomplete information claims kept. | Reflected at line 15. | synced |
| C7 | EUDF as usable/unusable inventory function kept. | Reflected at line 15. | synced |
| C8 | Maintenance/repositioning interaction kept with Wang/Jin/Hu citations. | Reflected at line 15 and line 21. | synced |
| C9 | Prior decomposition citations kept only on supported prior-method clauses. | Reflected at line 19; internally only partially supported by Chapter 3 examples, so P2 revise later. | synced with caution |
| C10 | Integrated-setting sentence reworded with clause-level citations. | Reflected at line 23. | synced |
| C11 | No claim that UDF/EUDF/broken-bike modelling is new. | Confirmed by phrase search; no disallowed novelty phrase found. | synced |

## Unresolved author questions

1. For Chapter 5, should Chapter 1 and the thesis spine describe the method as using one shared rebalancing time budget with separate truck/repairer time components, or should Chapter 5 itself be changed to a genuinely separate-budget model?
2. Should the line-47 internal guardrail about "not a simple replacement of UDF by EUDF" remain in Chapter 1, or should that point be expressed only through the positive synthesis claim?
3. Should "resource budgets" in the background remain as a broad informal phrase, or should it be narrowed to time, capacity, fleet, and station-level operating-time constraints?
4. Should Chapter 1 stay as three compact sections, or should RQs/objectives/contributions/outline receive labels or subsections for navigation?

## Recommended next patch scope

Do not do a broad rewrite. The next patch should be limited to resolving the P0/P1 items:

- Chapter 1 lines 25, 32, 39, 47, and 57: resolve the Chapter 5 "separate truck and repairer budgets" mismatch.
- Chapter 1 line 15: clarify "limited time and resource budgets" if the author wants strict consistency with the formal models.
- Chapter 1 line 47: decide whether to keep or remove the internal guardrail-style sentence.
- Chapter 1 line 53: tighten the "rather than used only after routes have been generated" clause.
- Optional cleanup only if requested: normalize `on-site`/`on site` and `modelling`/`modeled`.

## Post-audit validation

Post-audit SHA-256 after adding this report:

```text
ec857a69d2c82084c2bda42f9a43f0196ea08df582be31abc433d6b22ea62349  Chapters/Chapter1.tex
9fc586e89f4253f77e6a4bdfb1a952292fcf7a9faa20674cb8c1d0f65483a396  Chapters/Chapter3.tex
a7023648773dbf3a593818bc460f8594f932165e08d2e0ac37fa438df4ff9a18  Chapters/Chapter4.tex
3e3e9bd397f8867c38f942ac192d6f8948b102077acb19f3962517b74e8821b6  Chapters/Chapter5.tex
```

The Chapter 1/3/4/5 hashes match the pre-audit hashes. No thesis source file was changed by this audit. The only intended new artifact is this report: `tracking/codex_reports/2026-06-24_chapter1_internal_consistency_audit.md`.

Actual final `git status --short` matches the pre-audit dirty state plus this new untracked directory:

```text
?? tracking/codex_reports/
```

All other worktree changes were already present before this read-only audit and are listed in the pre-audit status block above.
