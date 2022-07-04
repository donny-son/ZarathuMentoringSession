MATCH (n) DETACH DELETE n;

CREATE (p:Person {name: '손동욱'});
CREATE (p:Person {name: '김진섭'});
CREATE (p:Person {name: '한종철'});
CREATE (p:Person {name: '박상언'});
CREATE (p:Person {name: '진익훈'});
CREATE (p:Person {name: '어준경'});
CREATE (c:Company {name: 'Zarathu'});
CREATE (c:Company {name: 'BagStation'});
CREATE (c:Company {name: 'Bulkrum'});
CREATE (c:Company {name: 'Silvia'});
CREATE (c:Company {name: 'Samsung Medical Center'});
CREATE (c:Company {name: 'National Cancer Center'});
CREATE (s:School {name: 'Yonsei', lvl: 'bachelor', major: 'Applied Statistics'});
CREATE (s:School {name: 'Yonsei', lvl: 'graduate', major: 'Statistics and Data Science'});
CREATE (s:School {name: 'Yonsei', lvl: 'graduate', major: 'Business School'});
CREATE (pr:Project {name: 'High Performance Computing Cluster', details: ['SLURM', 'Kubernetes', 'JupyterHub']});
CREATE (pr:Project {name: 'Ophthalmology Research', details: ['Automation(Concurrent Extractor)', 'Analysis(Survival)', 'CV', 'Go', 'Visualization']});
CREATE (pr:Project {name: 'ML Training Environment Containerization', details: ['Docker', 'Hydra', 'Speech Recognition']});
CREATE (pr:Project {name: 'Court Auction Service', details: ['Python', 'Web Automation']});
CREATE (pr:Project {name: 'Research Computing Environment Design', details: ['Linux', 'Sysadmin', 'Security']});
CREATE (pr:Project {name: 'PostGIS Database Design'});
CREATE (pr:Project {name: 'Legislation Monitoring System w/ GraphDB'});
CREATE (pr:Project {name: 'Social Platform for solving local problems'});

MATCH 
    (me: Person {name: '손동욱'}), 
    (ha: Person {name: '한종철'}),
    (ki: Person {name: '김진섭'}),
    (pa:Person {name: '박상언'}),
    (ji:Person {name: '진익훈'}),
    (eo:Person {name: '어준경'}),

    (za: Company {name: 'Zarathu'}),
    (ba: Company {name: 'BagStation'}),
    (si: Company {name: 'Silvia'}),
    (nc: Company {name: 'National Cancer Center'}),
    (sa:Company {name: 'Samsung Medical Center'}),
    (Bulkrum: Company {name: 'Bulkrum'}),

    (yondas:School {name: 'Yonsei', lvl: 'graduate', major: 'Statistics and Data Science'}),
    (yonbiz:School {name: 'Yonsei', lvl: 'graduate', major: 'Business School'}),
    (yonstat:School {name: 'Yonsei', lvl: 'bachelor', major: 'Applied Statistics'}),

    (oph:Project {name: 'Ophthalmology Research'}),
    (mlcon:Project {name: 'ML Training Environment Containerization'}),
    (hpc:Project {name: 'High Performance Computing Cluster'}),
    (courtcrawl:Project {name: 'Court Auction Service'}),
    (bizcom:Project {name: 'Research Computing Environment Design'}),
    (postgis:Project {name: 'PostGIS Database Design'}),
    (lawmap:Project {name: 'Legislation Monitoring System w/ GraphDB'}),
    (hgs:Project {name: 'Social Platform for solving local problems'})
CREATE 
    (me)-[:WORKED_FOR]->(za),
    (me)-[:WORKED_FOR]->(ba),
    (me)-[:WORKED_FOR]->(si),
    (me)-[:WORKED_FOR]->(ha),
    (me)-[:WORKED_FOR]->(yondas),
    (me)-[:WORKED_FOR]->(eo),
    (me)-[:WORKS_FOR]->(nc),
    (pa)-[:WORKS_FOR]->(yonstat),
    (pa)-[:WORKS_FOR]->(yondas),
    (ji)-[:WORKS_FOR]->(yonstat),
    (ji)-[:WORKS_FOR]->(yondas),
    (ji)-[:OVERVIEWED]->(hpc),
    (pa)-[:OVERVIEWED]->(me),
    (eo)-[:WORKS_FOR]->(yonbiz),
    (ha)-[:WORKS_FOR]->(sa),
    (me)<-[:RUN_BY]-(Bulkrum),
    (ki)<-[:RUN_BY]-(za),
    (ha)<-[:RUN_BY]-(oph),
    (ki)<-[:후배]-(ha),
    (si)-[:APPROVED]->(mlcon),
    (yonstat)-[:APPROVED]->(hpc),
    (eo)-[:APPROVED]->(bizcom),
    (ba)-[:APPROVED]->(courtcrawl),
    (nc)-[:APPROVED]->(postgis),
    (Bulkrum)-[:ONGOING]->(lawmap),
    (Bulkrum)-[:ONGOING]->(hgs),
    (me)-[:LED]->(postgis),
    (me)-[:LED]->(mlcon),
    (me)-[:LED]->(hpc),
    (me)-[:PARTICIPATED_IN]->(courtcrawl),
    (ki)-[:PARTICIPATED_IN]->(oph),
    (me)-[:PARTICIPATED_IN]->(oph),
    (me)-[:CONSULTED_ON]->(bizcom),
    (me)-[:GRADUATED]->(yonstat),
    (me)-[:GRADUATED]->(yondas),
    (ha)-[:LED]->(oph);
