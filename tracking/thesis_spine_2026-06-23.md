# Thesis Spine — Final T2 Version

## One-sentence thesis logic

This thesis develops scalable optimization methods for static bike repositioning under user-dissatisfaction-based service-level evaluation by advancing along two complementary directions—UDF-aware decomposition for usable-bike repositioning and integrated planning of usable-bike repositioning, broken-bike collection, and on-site repair—and subsequently unifying them in an EUDF-aware cluster-first, route-second framework for large-scale systems.

## Central problem

The central problem of this thesis is how to embed user-dissatisfaction-based service-level evaluation into computationally tractable solution methods for increasingly complex static bike repositioning problems. In this thesis, this expression refers to evaluating post-repositioning station states through the expected user dissatisfaction associated with bicycle and locker shortages. It is operationalized through the User Dissatisfaction Function (UDF) and the Extended User Dissatisfaction Function (EUDF).

The UDF represents user dissatisfaction as a weighted sum of the expected shortages of bicycles and lockers over a planning period, expressed as a function of the station’s initial bicycle inventory. The EUDF extends this representation by considering the initial inventories of both usable and broken bicycles.

The methodological challenge addressed in this thesis is not the introduction of the UDF, the EUDF, or their use in bike-repositioning formulations. Rather, it concerns how these functions can be embedded into decomposition and heuristic solution methods, how they can support the joint planning of usable-bike repositioning, broken-bike collection, and on-site repair, and how the resulting problems can be solved at practically relevant scales.

## Research questions

### RQ1

**How can a cluster-first, route-second framework for the multi-vehicle static bike repositioning problem incorporate estimated UDF reduction and per-vehicle routing-time feasibility directly into its clustering stage?**

Corresponding chapter: **Chapter 3**

The focus is not on introducing a UDF-based formulation of the static bike repositioning problem. It is on designing an optimization-based clustering stage that jointly considers:

* the potential UDF reduction achievable within each cluster;
* the routing-time feasibility of assigning a vehicle to that cluster; and
* the scalable solution of the resulting clustering problem through ATS and HGS-UC.

### RQ2

**How can a static bike repositioning problem that jointly coordinates truck-based usable-bike repositioning and broken-bike collection with repairer-based on-site repair be modeled and solved efficiently?**

Corresponding chapter: **Chapter 4**

The focus is not on introducing broken-bike collection, the simultaneous representation of usable and broken bicycles, or the EUDF itself. It is on the integrated operational planning of:

* usable-bike repositioning by trucks;
* broken-bike collection by trucks;
* on-site repair by independently routed repairers;
* truck and repairer routes;
* station-level loading, unloading, collection, and repair quantities; and
* user dissatisfaction and truck carbon emissions.

### RQ3

**How can the UDF-aware cluster-first, route-second principle developed for usable-bike repositioning be extended to large-scale static bike repositioning problems with broken bikes and on-site repair, where cluster evaluation must account for bivariate EUDF changes and separate truck and repairer budgets?**

Corresponding chapter: **Chapter 5**

The focus is on applying and adapting the decomposition principle developed in Chapter 3 to the integrated operational setting studied in Chapter 4. The extension must account for:

* usable-bike and broken-bike inventories;
* usable-bike transfers;
* broken-bike collection;
* on-site repair;
* the coupled inventory effects of repair operations; and
* separate operational budgets for trucks and repairers.

## Chapter progression

### Chapter 3: Methodological foundation

Chapter 3 establishes the methodological foundation of the thesis by developing a UDF-aware cluster-first, route-second framework for the multi-vehicle static bike repositioning problem.

Rather than introducing another UDF-based formulation of the underlying repositioning problem, the chapter focuses on the clustering stage of the decomposition. It develops a clustering model that jointly evaluates potential UDF reduction and per-vehicle routing-time feasibility. Routing feasibility is approximated within the clustering model before detailed routes are constructed.

Activated Transfer Selection (ATS) is introduced to estimate a time-feasible set of bike transfers and the associated UDF reduction within a candidate cluster. Hybrid Genetic Search for UDF-aware Clustering (HGS-UC) is developed to solve the resulting clustering problem on large station networks.

### Chapter 4: Operational pillar

Chapter 4 establishes the operational pillar of the thesis by broadening the repositioning setting to include broken bikes and on-site repair.

The problem jointly coordinates trucks that reposition usable bikes and collect broken bikes with repairers who travel independently and repair broken bikes directly at stations. It therefore requires simultaneous decisions concerning truck routes, repairer routes, bike-handling quantities, and on-site repair quantities.

A time-indexed mixed-integer linear programming formulation is developed for the integrated problem. The HGSADC-SBC solution method combines hybrid genetic search with adaptive diversity control and a station-budget-constrained heuristic. The chapter also investigates how repair duration and the proportion of broken bikes affect the cost-effectiveness of introducing on-site repairers.

### Chapter 5: Methodological and operational synthesis

Chapter 5 combines the decomposition methodology of Chapter 3 with the integrated operational setting of Chapter 4.

It extends the UDF-aware cluster-first, route-second principle from a one-dimensional usable-bike inventory setting to a bivariate EUDF setting involving usable bikes, broken bikes, trucks, and repairers. Candidate clusters must therefore be evaluated according to the joint effects of usable-bike transfers, broken-bike collection, and on-site repair.

Extended Activated Transfer Selection (EATS) is developed to estimate the EUDF reduction achievable within a candidate cluster under separate truck and repairer budgets. Hybrid Genetic Search for Extended-UDF Clustering (HGS-EUC) then uses this evaluation to construct station clusters for large-scale instances.

### Overall relationship

The progression of Chapters 3–5 is not simply a sequence of increasingly detailed formulations.

* **Chapter 3 develops the decomposition methodology.**
* **Chapter 4 develops the integrated operational problem.**
* **Chapter 5 synthesizes these two research directions into a scalable EUDF-aware solution framework.**

## Thesis objectives

### Objective 1

To develop a UDF-aware cluster-first, route-second framework in which the clustering stage jointly accounts for potential user-dissatisfaction reduction and routing-time feasibility.

### Objective 2

To formulate and solve an integrated static bike repositioning problem that jointly coordinates usable-bike repositioning, broken-bike collection, and repairer-based on-site repair.

### Objective 3

To extend the UDF-aware decomposition methodology to large-scale problems with usable and broken bikes by developing an EUDF-aware clustering framework that accounts for both truck and repairer operations.

## Thesis contributions

### Contribution 1: UDF-aware decomposition

This thesis develops a UDF-aware cluster-first, route-second framework for the multi-vehicle static bike repositioning problem. Its clustering stage jointly considers estimated UDF reduction and per-vehicle routing-time feasibility rather than partitioning stations solely according to geographic proximity.

ATS is introduced to estimate time-feasible bike transfers and their associated UDF reduction within candidate clusters. HGS-UC is developed to solve the resulting optimization-based clustering problem on large station networks.

### Contribution 2: Integrated repositioning and on-site repair

This thesis develops an integrated static bike repositioning problem in which trucks reposition usable bikes and collect broken bikes while independently routed repairers repair broken bikes on site.

A time-indexed mixed-integer linear programming formulation and the HGSADC-SBC solution method are developed to coordinate the two fleets. The station-budget concept is introduced to allocate operating time among station-level loading, unloading, collection, and repair activities. Computational analyses further identify the conditions affecting the cost-effectiveness of introducing on-site repairers.

### Contribution 3: EUDF-aware large-scale decomposition

This thesis extends the UDF-aware decomposition methodology to the static bike repositioning problem with broken bikes and on-site repair.

The resulting EUDF-aware framework evaluates candidate clusters through the combined effects of usable-bike transfers, broken-bike collection, and on-site repair. EATS is developed to estimate these effects under separate truck and repairer budgets, while HGS-EUC is developed to solve the resulting station-partitioning problem for large-scale networks.

## Scope of the thesis

This thesis considers static repositioning operations in station-based bike-sharing systems over an off-peak planning horizon.

The studied operational decisions include:

* truck routes and bike-handling quantities;
* repairer routes and on-site repair quantities;
* the allocation of usable-bike transfers and broken-bike collection;
* the partitioning of stations for decomposition-based solution methods; and
* the allocation of operational time among routing and station-level activities.

The methodological emphasis is on mixed-integer programming formulations, cluster-first, route-second decomposition, constructive heuristics, and hybrid genetic search.

Repositioning outcomes are evaluated using the UDF or EUDF. Truck carbon emissions are additionally considered in the integrated problem studied in Chapter 4.

## Chapter outline

Chapter 1 introduces the research background, motivations, research questions, objectives, contributions, and scope of the thesis.

Chapter 2 reviews the literature on static bike repositioning, service-level evaluation based on user dissatisfaction, bike-repositioning problems involving broken bikes, on-site repair operations, and cluster-first, route-second solution methods. It identifies the methodological and operational gaps addressed in the subsequent chapters.

Chapter 3 develops a UDF-aware cluster-first, route-second decomposition framework for the multi-vehicle static bike repositioning problem. It formulates the clustering stage to account jointly for estimated UDF reduction and routing-time feasibility and develops ATS and HGS-UC for large-scale station partitioning.

Chapter 4 studies an integrated static bike repositioning problem in which trucks reposition usable bikes and collect broken bikes while repairers perform on-site repairs. It presents a time-indexed formulation, develops the HGSADC-SBC solution method, and examines the operational conditions under which introducing on-site repairers is cost-effective.

Chapter 5 combines the decomposition methodology of Chapter 3 with the integrated operational setting of Chapter 4. It develops an EUDF-aware cluster-first, route-second framework, together with EATS and HGS-EUC, for large-scale problems involving usable bikes, broken bikes, trucks, and repairers.

Chapter 6 summarizes the principal findings and contributions of the thesis and presents directions for future research.

## Terminology rules

### Umbrella concept

**user-dissatisfaction-based service-level evaluation**

This describes the general evaluation perspective adopted across the thesis.

### Concrete functions

* **User Dissatisfaction Function (UDF)**
* **Extended User Dissatisfaction Function (EUDF)**

### Method-specific expressions

* **UDF-based evaluation**
* **EUDF-based evaluation**
* **UDF-aware decomposition**
* **EUDF-aware decomposition**
* **estimated UDF reduction**
* **estimated EUDF reduction**

### Expressions to avoid

* demand-based user-dissatisfaction measure;
* demand-based service-level measure;
* service-quality information when the intended quantity is specifically the UDF or EUDF;
* claims that deviation-based objectives do not measure service quality.

## Internal novelty guardrails — not thesis text

```text
Do not claim that UDF-based static bike repositioning formulations are new.

Do not claim that the EUDF or EUDF-based modeling is new.

Do not claim that Chapter 3 is the first study to use UDF reduction
within a clustering or decomposition procedure.

State the Chapter 3 novelty as jointly embedding estimated UDF reduction
and per-vehicle routing-time feasibility within an optimization-based
clustering stage and developing scalable algorithms for that problem.

For Chapter 4, emphasize the joint planning of truck-based usable-bike
repositioning and broken-bike collection with independently routed
repairer-based on-site repair.

Do not present broken-bike consideration, usable/broken inventory
representation, or the EUDF alone as the Chapter 4 novelty.

For Chapter 5, emphasize that the Chapter 3 decomposition principle is
adapted to the Chapter 4 operational setting.

Do not describe Chapter 5 as merely replacing the UDF with the EUDF.
Its extension includes bivariate station states, coupled repair effects,
three forms of station intervention, and separate truck and repairer budgets.

Keep defensive exclusions and statements about topics outside the thesis
in internal notes rather than in the thesis narrative.
```

## Frozen thesis spine

```text
Frozen thesis spine: 2026-06-23.

Core structure:
Chapter 3 = methodological foundation.
Chapter 4 = operational pillar.
Chapter 5 = methodological and operational synthesis.

Umbrella concept:
User-dissatisfaction-based service-level evaluation.

Concrete evaluation functions:
UDF and EUDF.

The thesis novelty does not lie in introducing the UDF, the EUDF,
or broken-bike modeling.

The novelty lies in UDF-aware decomposition design, integrated
truck–repairer planning, and the EUDF-aware large-scale synthesis
of these two research directions.
```
