# AWS Certified Developer – Associate (DVA‑C02) **Hands‑On Training Plan – Java Track**

**Total duration:** 10 weeks\
**Weekly effort:** 8‑10 hours (≈ 4 h study + 4 h hands‑on + 2 h practice/review)\
**Target outcome:** Pass the AWS Certified Developer – Associate exam (DVA‑C02) **and** gain confidence building cloud‑native services from scratch using **Java 17** and the **AWS SDK for Java v2**.

---

## How to use this plan

- Treat each week as an agile sprint: finish readings up‑front; spend most time building, testing, and tearing down.
- Keep a public Git repo (or CodeCommit) for all code/labs.
- At week’s end complete the **Checkpoint** and note blockers; I’ll help troubleshoot or extend.
- Feel free to shift tasks between weeks to fit your schedule, but aim for \~8‑10 h total.

---

| Week              | Focus & Exam Domain Weight               | Java‑Centric Hands‑On Objectives (Free Tier where possible)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          | Key Resources                                                                         | Checkpoints                                       |
|-------------------|------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------|---------------------------------------------------|
| **0 • Kick‑off**  | Orientation                              | • Create/secure AWS account, configure **Budgets & Alerts**. • Install **JDK 17**, IntelliJ IDEA / VS Code (AWS Toolkit plugin). • Install & configure **AWS CLI v2**, **AWS SAM CLI**, and Docker Desktop. • Create a starter Maven project and include the **AWS SDK v2 BOM**. • Skim the **Exam Guide** and blueprint, take a 20‑question baseline quiz.                                                                                                                                                                                                          | Exam Guide PDF; AWS Free Tier docs; AWS Toolkit for IntelliJ; AWS CLI & SAM workshops | Baseline quiz score logged; SDK sample compiles   |
| **1**             | **Development with AWS Services (32 %)** | • Review service integration patterns (sync vs async, orchestration vs choreography). • Run `sam init --app-template hello-lambda-java` to scaffold a **Java 17 Lambda**. • Expose it through an **HTTP API (API Gateway)**. • Write **JUnit 5** unit tests, build with Maven, deploy with `sam deploy`. • Use the **AWS SDK v2 LambdaClient** from a local integration test.                                                                                                                                                                                        | AWS “Getting Started with Lambda (Java)” workshop; Serverless Land patterns           | Code pushed; unit & integ tests pass in CodeBuild |
| **2**             | Data Stores                              | • Create a **DynamoDB** table (PK + SK). • Perform CRUD with the **DynamoDbEnhancedClient** (Java v2). • Add **DAX** or **ElastiCache Redis** read‑through caching. • Store objects in **S3** (using S3Client), configure lifecycle to Glacier Instant.                                                                                                                                                                                                                                                                                                              | DynamoDB Developer Guide (Java examples); S3 Java examples; DynamoDB Labs             | CLI query vs scan quiz ≥ 80 %; budget check       |
| **3**             | Event‑Driven Integration                 | • Publish to **SNS** topic using SnsClient; subscribe **SQS** queue. • Trigger Lambda (Java) from SQS with batch size = 5. • Create **EventBridge** custom bus & rule (filter by detail‑type) using CloudFormation YAML.                                                                                                                                                                                                                                                                                                                                             | AWS Samples: Serverless Airline (Java branch); EventBridge StackSets workshop         | DLQ has failed‑event count ≤ 1                    |
| **4**             | Lambda Deep Dive                         | • Refactor to **Layers** (e.g., common utilities jar). • Externalise config via **AWS SAM Parameters** and env vars. • Configure **reserved concurrency**, timeout, memory; benchmark with **AWS SAM CLI \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*****`sam sync --watch`**. • Use **AWS Lambda Power Tuning** state machine and interpret cost/perf heat‑map. | AWS SAM Docs (Java); Lambda Power Tuning repo                                         | 95th‑pct latency improved ≥ 20 %                  |
| **5**             | **Security (26 %)**                      | • Create fine‑grained **IAM** role & policy JSON for Lambda (least privilege). • Add **Amazon Cognito** user pool; update API Gateway authorizer to validate **JWT**. • Encrypt S3 object with **KMS CMK**; enable key rotation; decrypt via Java crypto client.                                                                                                                                                                                                                                                                                                     | IAM & Cognito Dev Guides; AWS KMS Java examples                                       | IAM Policy Simulator shows only required actions  |
| **6**             | **Deployment – CI/CD (24 %)**            | • Build **CodePipeline**: source (CodeCommit or GitHub) → **CodeBuild** (Maven test) → `sam deploy` to **dev** & **prod** stages (blue/green). • Publish artifacts to **CodeArtifact**. • Add manual approval before prod.                                                                                                                                                                                                                                                                                                                                           | CI/CD for Serverless (Java path); CodePipeline labs; CodeBuild Maven sample           | Pipeline green end‑to‑end; prod alias at v > 1    |
| **7**             | Containers & Config                      | • Package microservice with **Amazon Corretto 17** base image; push to **ECR**. • Deploy with **AWS Copilot** → Fargate ECS service. • Externalise runtime parameters via **AWS AppConfig** (Java AppConfig Data Client).                                                                                                                                                                                                                                                                                                                                            | AWS Copilot Workshop; AppConfig Java samples                                          | `/health` endpoint returns 200 OK via ALB         |
| **8**             | Observability & Troubleshooting (18 %)   | • Emit **structured JSON logs** and **custom metrics** using **EMF** from Lambda (Log4j2 JSON layout). • Trace requests with **AWS X‑Ray** SDK (Java agent) across API Gateway → Lambda → DynamoDB. • Write CloudWatch Logs Insights query to find p95 latency.                                                                                                                                                                                                                                                                                                      | Observability workshop; X‑Ray Java agent docs                                         | Dashboard shows p95 < 500 ms                      |
| **9**             | Optimization & Review                    | • Run **Lambda Power Tuning** again after memory adjustments; compare cost curves. • Stress‑test DynamoDB with **`amazon-dynamodb-sample`**\*\* JMH tool\*\*; fine‑tune WCU/RCU & Auto Scaling. • Implement retry with **exponential backoff + jitter** using `RetryPolicy` in SDK v2.                                                                                                                                                                                                                                                                               | Well‑Architected Labs; AWS Cost Explorer                                              | Forecast shows monthly cost within target         |
| **10**            | Exam Readiness                           | • Take two timed practice exams (>= 80 % each). • Revisit weakest domains via targeted labs. • Book exam; run Pearson VUE system test.                                                                                                                                                                                                                                                                                                                                                                                                                               | Official Practice Set; Tutorials Dojo (Java explanations)                             | Practice exams passed; exam scheduled             |

---

### Java‑Specific Quick Links

- **AWS SDK for Java v2 Developer Guide** & Code Examples
- **Lambda Java 17 Runtime** best practices
- **AWS Toolkit** for IntelliJ/VS Code (deploy & debug from IDE)
- **AWS CDK (Java)** if you prefer high‑level IaC instead of SAM YAML.

### Continuous Learning

1. **Daily 15‑min flash review** of AWS service limits & important CLI/SDK commands.
2. Watch **re**\*\*:Invent\*\*\*\* Java serverless\*\* sessions in the evening (at 1.25× speed!).
3. Tear down stacks with `sam delete` or `aws cloudformation delete-stack` to stay in Free Tier.

### Guidance & Check‑ins

- **Weekly:** Share your Checkpoint artifacts & blockers; I'll review code snippets, suggest fixes, and add stretch goals.
- **Mid‑plan (after Week 5):** 60‑min mock interview & domain deep dive (Java‑focused questions).
- **Pre‑exam (Week 10):** Strategy session: timing, question‑elimination heuristics, mental breaks.

**Have fun building in Java — the best way to learn AWS is to ship and iterate!**

---

### Week 0 — Kick‑off Checklist (≈ 8 h)

| Day     | \~Time | Task                                                                                                                                                                   | Notes / Commands                                  |
|---------|--------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------|
| **D1**  | 1 h    | **Secure AWS account**▸ Enable MFA on the root user.▸ Create an *exam‑lab* IAM role with **AdministratorAccess**.▸ Set **AWS Budgets** (Cost Anomaly + Monthly limit). | Keep the account clean—delete lab stacks weekly.  |
| **D1**  | 30 min | **Install JDK 21** (Temurin or Amazon Corretto)                                                                                                                        | `java -version` → 17.x                            |
| **D1**  | 30 min | **IntelliJ IDEA** + **AWS Toolkit** plugin                                                                                                                             | Settings ▸ Plugins ▸ “AWS Toolkit”.               |
| **D2**  | 1 h    | **CLI & SAM setup**`brew install awscli``brew tap aws/tap && brew install aws-sam-cli`                                                                                 | Windows: use official installers.                 |
| **D2**  | 30 min | **Configure CLI**`aws configure` → Access Key / Secret / region `eu-north-1`                                                                                           | Validate with `aws sts get-caller-identity`.      |
| **D2**  | 30 min | **Install Docker Desktop** (for SAM local).                                                                                                                            | Enable virtualization if needed.                  |
| **D3**  | 1 h    | **Starter project**`sam init --app-template hello-lambda-java --runtime java21 --name hello-java``cd hello-java && mvn -DskipTests package`                            | Deployable Java 17 Lambda ready.                  |
| **D3**  | 30 min | **Add AWS SDK BOM** to *pom.xml* (if not already).                                                                                                                     | Ensures all SDK modules stay aligned.             |
| **D4**  | 1 h    | **Deploy from IntelliJ** (AWS Toolkit ▸ Deploy Serverless Application).                                                                                                | Deploy to *dev* stack in CloudFormation.          |
| **D4**  | 30 min | **Smoke test** via CLI:`aws lambda invoke --function-name HelloJavaFunction --payload '{}' out.json && cat out.json`                                                   | Expect JSON with `statusCode: 200`.               |
| **D5**  | 1 h    | **Baseline quiz (20 q)** — AWS sample or Tutorials Dojo.                                                                                                               | Note score + weak domains.                        |

**Deliverables**

1. CLI screenshot of Lambda invocation.
2. Baseline quiz score & weakest domain(s).
3. List any blockers.

**Stretch (+2 h optional)**

- Repeat `sam build && sam deploy` entirely in **AWS CloudShell**.
- Commit code to **CodeCommit**; open a PR.

---
