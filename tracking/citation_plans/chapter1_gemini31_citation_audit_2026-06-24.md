# Chapter 1 Gemini 3.1 Pro Citation Audit

Date: 2026-06-24

Scope: `Chapters/Chapter1.tex`, Introduction only.

Model used: `models/gemini-3.1-pro-preview`. The Gemini API did not list a non-preview `gemini-3.1-pro` model; the available 3.1 Pro model was the preview endpoint.

Workflow:

1. Candidate references were screened from Zotero.
2. Meaning-sensitive claims were checked against attached Zotero PDFs using extracted PDF text.
3. For each claim intended for Chapter 1, the proposed thesis sentence and short PDF-derived source excerpts were sent to Gemini 3.1 Pro for citation-support judgment.
4. Only high-confidence or Gemini-supported/partially-supported citations were inserted into Chapter 1.
5. The one partially supported sentence was revised before insertion.

Additional verification pass, 2026-06-24:

Codex reran the Gemini check through the Gemini API using `models/gemini-3.1-pro-preview`; the model list still did not expose a non-preview `gemini-3.1-pro` endpoint. The rerun used the current Chapter 1 wording plus short Zotero/PDF-derived evidence snippets. It returned `supported` for C1, C3, C6, C7, and C8, and `partially_supported` for C2, C4, C5, C9, and C10. The partially supported cases were handled by narrowing the thesis wording or restricting citations to the clause actually supported by the supplied evidence.

## Added Zotero Sources

These Zotero-verified sources were added to `thesis.bib` because they support Chapter 1 background claims and were not already present in the project bibliography.

| Citation key | Zotero/PDF evidence basis | Chapter 1 use |
|---|---|---|
| `demaioBikesharingHistoryImpacts2009` | PDF | general BSS background; first/last-mile and environmental motivation |
| `nathModellingMethodsPlanning2019` | PDF | short trips and public-transit connection |
| `alvarez-valdesOptimizingLevelService2016` | PDF | BSS deployment, sustainability, service quality affected by imbalance |
| `datnerSettingInventoryLevels2019` | PDF | station rent/return setting; asymmetric demand and bike/locker shortages |
| `brinkmannInventoryRoutingBike2016` | PDF | empty/full stations; inventory routing and overnight relocation |
| `kaspiDetectionUnusableBicycles2016` | PDF | unusable bicycles occur and may be difficult to identify |

## Gemini-Audited Claim Map

| ID | Thesis claim checked | Proposed citations | PDF evidence basis sent to Gemini | Gemini verdict | Action in Chapter 1 |
|---|---|---|---|---|---|
| C1 | BSSs are deployed in many cities; support short trips, first/last mile, and environmental mobility. | `alvarez-valdesOptimizingLevelService2016`; `demaioBikesharingHistoryImpacts2009`; `nathModellingMethodsPlanning2019` | Alvarez-Valdes: deployed in hundreds of cities and sustainable mobility; DeMaio: first/last-mile and environmental impacts; Nath: short trips and transit connection. | Supported | Inserted with split citations near the supported clauses. |
| C2 | Station-based BSSs allow users to rent at one station and return at another; station state depends on bikes and vacant lockers. | `datnerSettingInventoryLevels2019`; `ravivOptimalInventoryManagement2013`; `ravivStaticRepositioningBikesharing2013` | Datner: rent from automatic stations and return to any station; Raviv papers: state includes bicycles and vacant lockers. | Supported | Inserted with citation after rent/return sentence and after station-state sentence. |
| C3 | Too few bikes and too few vacant lockers are two forms of service failure, making station inventory management central to operation. | `ravivOptimalInventoryManagement2013`; `ravivStaticRepositioningBikesharing2013` | Raviv and Kolka: meeting demand for bicycles and vacant lockers is crucial; service cannot be provided at empty/full stations. Raviv et al.: shortage events occur at empty/full stations and operators reposition to reduce shortages. | Supported | Kept, with the same two citations placed immediately after the synthesized sentence. |
| C4 | Failed rentals and failed returns indicate that post-repositioning inventories do not support service. | `ravivOptimalInventoryManagement2013`; `ravivStaticRepositioningBikesharing2013` | Raviv and Kolka: UDF is expected penalty from abandonments as a function of initial inventory. Raviv et al.: penalty functions represent expected shortages during the next day given initial inventory. | Partially supported | Revised to: failed rentals and failed returns indicate that initial post-repositioning inventories do not adequately prevent expected shortages during the subsequent demand period. |
| C5 | Demand is uneven across space/time; timing and direction of trips create local shortages; repositioning moves bicycles before the next demand period. | `datnerSettingInventoryLevels2019`; `ravivOptimalInventoryManagement2013`; `brinkmannInventoryRoutingBike2016`; `ravivStaticRepositioningBikesharing2013` | Datner: nonhomogeneous asymmetric demand causes bike/locker shortages; Brinkmann: spatio-temporal variation creates empty/full stations; Raviv papers: repositioning shifts bikes and prepares initial inventories. | Supported | Inserted with separate citations for demand asymmetry, empty/full stations, and repositioning. |
| C6 | Static repositioning is night/low-demand planning; vehicles load/unload bikes; BRP jointly determines routes and quantities. | `forma3stepMathHeuristic2015`; `ravivStaticRepositioningBikesharing2013`; `brinkmannInventoryRoutingBike2016` | Forma: night operation with dedicated vehicles loading/unloading; Raviv et al. and Brinkmann: routing and inventory decisions. | Supported | Inserted with split citations for static timing and routing/inventory decisions. |
| C7 | User-dissatisfaction-based service-level evaluation is the thesis umbrella; UDF links inventory to expected rental/return service failures. | `ravivOptimalInventoryManagement2013`; `ravivStaticRepositioningBikesharing2013` | Raviv and Kolka: UDF expected penalty due to abandonments; Raviv et al.: penalty functions represent expected shortages after repositioning. | Supported | Inserted; umbrella phrase is thesis framing, UDF definition is cited. |
| C8 | EUDF evaluates user dissatisfaction as a function of usable and unusable inventories; broken/unusable bikes cannot be rented and can block lockers. | `kaspiBikesharingSystemsUser2017`; `kaspiDetectionUnusableBicycles2016` | Kaspi et al. 2017: EUDF adds unusable-bike dimension; unusable bikes cannot be rented and block lockers. Kaspi et al. 2016: unusable bicycles occur and need detection. | Supported | Inserted in the background section with both sources. |
| C9 | Broken-bike handling interacts with repositioning through collection, locker capacity, truck capacity, maintenance, and on-site repair. | `kaspiBikesharingSystemsUser2017`; `wangStaticGreenRepositioning2018`; `jinSimulationFrameworkOptimizing2022`; `huRepositioningBikeSharing2025` | Kaspi: unusable bikes block lockers and may need removal; Wang: broken bikes consume vehicle capacity and are collected to depots; Jin: maintenance is performed with rebalancing; Hu: repairers conduct on-site repairs. | Supported | Inserted with collection/capacity citations separated from on-site repair citation. |
| C10 | Existing clustering/decomposition approaches use geographic, inventory, service-feasibility, or routing-cost information rather than this thesis's direct UDF-reduction and per-vehicle routing-time feasibility design. | `forma3stepMathHeuristic2015`; `schuijbroekInventoryRebalancingVehicle2017` | Forma: clusters use geographic and inventory considerations; Schuijbroek: clustering considers service-level feasibility and approximate routing costs. | Supported | Inserted without claiming priority or absence of all prior UDF-aware work. |
| C11 | The thesis contribution is not introducing UDF, EUDF, or broken-bike modelling; it lies in UDF-aware decomposition, integrated truck-repairer planning, and EUDF-aware synthesis. | none | Thesis spine and novelty guardrails. | Supported as thesis self-positioning | Inserted without external citation. |

## Rerun Evidence Snippets Sent to Gemini

The rerun sent only short evidence snippets rather than long PDF passages. Representative snippets included:

| Source | Short excerpt used for claim checking |
|---|---|
| Alvarez-Valdes et al. (2016) | "deployed in hundreds of cities worldwide"; "environmentally sustainable way" |
| Nath and Rambha (2019) | "ideal for short trips"; "connecting to public transit systems" |
| Datner et al. (2019) | "nonhomogeneous asymmetric demand processes"; "shortages either of bicycles" |
| Brinkmann et al. (2016) | "stations tend to either be empty or full"; "no bikes can be rented" |
| Raviv and Kolka (2013) | "expected penalty due to the abandonments"; "function of the initial inventory" |
| Raviv et al. (2013) | "routes that the vehicles should follow"; "number of bicycles" |
| Kaspi et al. (2016) | "bicycles become unusable every day"; "no reliable on-line information" |
| Kaspi et al. (2017) | "initial inventory of usable and unusable bicycles"; "bivariate function" |
| Forma et al. (2015) | "clustered according to geographic"; "inventory ... considerations" |
| Schuijbroek et al. (2017) | "service level feasibility"; "approximate routing costs" |
| Wang and Szeto (2018) | "usable bikes are needed to redistribute"; "broken bikes need to be carried back" |
| Jin et al. (2022) | "bike rebalancing and system maintenance must be performed" |
| Hu et al. (2025) | "vehicle-based bike delivery/collection"; "labor-based on-site repairs" |

## Rerun Gemini Verdicts and Actions

| ID | Rerun verdict | Action taken in `Chapters/Chapter1.tex` |
|---|---|---|
| C1 | Supported | Kept first-paragraph deployment/short-trip/public-transit framing and added a closer citation to the service-availability sentence. |
| C2 | Partially supported | Removed the broader "mobility service and spatially distributed inventory system" characterization; kept rent/return and station-state claims. |
| C3 | Supported | Kept the demand-imbalance and empty/full-station claims. |
| C4 | Partially supported | Removed the dynamic-repositioning contrast from Chapter 1 because the rerun evidence pack did not include a direct supporting excerpt for it. |
| C5 | Partially supported | Reworded the UDF sentence to use "expected penalty due to user abandonments" and "initial station inventory." |
| C6 | Supported | Kept unusable-bike occurrence and incomplete-information claims. |
| C7 | Supported | Kept EUDF as a function of usable and unusable bicycle inventories. |
| C8 | Supported | Kept the maintenance/repositioning interaction sentence with Wang, Jin, and Hu citations. |
| C9 | Partially supported | Kept citations only on the prior decomposition approaches; thesis-specific UDF-aware design remains a contribution statement. |
| C10 | Partially supported | Reworded the integrated-setting sentence and added clause-level citations for bivariate states, broken-bike collection, and truck/repairer resources. |

## Direct Response to the Two Challenged Citations

1. The sentence about two service failures making station inventory management central to operation is supported by the two Raviv sources when worded as a synthesis. The PDF evidence is that these papers define bicycle and vacant-locker shortages as the user-facing failures and describe inventory/repositioning decisions as the mechanism used to address them.

2. The original sentence using "intended service level" was too loose, and the rerun also treated the "failed rentals and failed returns" wording as an extrapolation from the supplied evidence. Chapter 1 now uses the narrower wording that the UDF represents expected penalty due to user abandonments as a function of initial station inventory.

## Citation Hygiene Notes

- Low-confidence citations were not inserted.
- Chapter 1 now uses a broader source base than the prior draft: DeMaio (2009), Alvarez-Valdes et al. (2016), Brinkmann et al. (2016), Kaspi et al. (2016), Nath and Rambha (2019), and Datner et al. (2019) were added alongside the existing BRP/UDF/broken-bike sources.
- Citations were placed near the specific claims they support instead of only at paragraph ends.
- No claim states that UDF, EUDF, or broken-bike modelling is new.
