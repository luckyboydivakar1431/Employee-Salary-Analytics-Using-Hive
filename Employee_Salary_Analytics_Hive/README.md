# Employee Salary Analytics Using Apache Hive

## Project overview
This Big Data Analytics (BDA) mini-project analyzes employee salary information using Apache Hive. It demonstrates how structured employee data can be stored in Hive and queried to understand salary patterns by department, role, experience, location, and joining year.

**Dataset note:** `data/employee_salary.csv` is a synthetic sample dataset created for academic demonstration. It does not contain real employee records.

## Objectives
- Store employee salary data in a Hive table.
- Calculate average, minimum, and maximum salary.
- Compare salaries across departments and job roles.
- Study the relationship between experience and salary.
- Identify the highest-paid employees and department-level trends.

## Folder structure
```text
Employee_Salary_Analytics_Hive/
├── data/
│   └── employee_salary.csv
├── hive/
│   ├── 01_create_database_table.hql
│   └── 02_analysis_queries.hql
├── scripts/
│   └── run_hive_queries.sh
├── docs/
│   └── project_report_outline.md
├── .gitignore
└── README.md
```

## Requirements
- Linux environment (or a Hadoop/Hive setup such as a configured virtual machine)
- Java, Hadoop, and Apache Hive installed and configured
- HDFS running if your Hive installation uses HDFS
- Git and a GitHub account (for publishing the source project)

> Installation commands differ by operating system and Hadoop/Hive distribution. First verify your setup with `hadoop version` and `hive --version`.

## Run the project
1. Open a terminal in this project folder.
2. Start the Hadoop services required by your installation.
3. Create the HDFS directory and upload the CSV:
   ```bash
   hdfs dfs -mkdir -p /user/$USER/employee_salary/input
   hdfs dfs -put -f data/employee_salary.csv /user/$USER/employee_salary/input/
   ```
4. Run the table creation script:
   ```bash
   hive -f hive/01_create_database_table.hql
   ```
5. Run the analysis queries:
   ```bash
   hive -f hive/02_analysis_queries.hql
   ```

The HQL file uses `/user/<your-username>/employee_salary/input/employee_salary.csv`. If your HDFS username/path differs, edit the `LOCATION` in `hive/01_create_database_table.hql` before running it.

## Main analyses
1. Overall salary statistics.
2. Average salary by department.
3. Salary statistics by job role.
4. Average salary by experience band.
5. Top 10 highest-paid employees.
6. Employee count and average salary by city.
7. Hiring-year trends.
8. Department-wise salary ranking.

## GitHub upload (step by step)
### A. Create a repository on GitHub
1. Sign in to GitHub.
2. Click **New repository**.
3. Enter repository name: `employee-salary-analytics-hive`.
4. Choose **Public** or **Private** as required by your course.
5. Do not select “Add a README” because this folder already contains one.
6. Click **Create repository**.

### B. Push this folder using Git
Open a terminal in this project folder and run these commands one by one:
```bash
git init
git add .
git commit -m "Initial commit: Employee Salary Analytics using Hive"
git branch -M main
git remote add origin https://github.com/YOUR-USERNAME/employee-salary-analytics-hive.git
git push -u origin main
```
Replace `YOUR-USERNAME` with your GitHub username and use the repository URL shown by GitHub.

### C. Check the upload
Refresh your GitHub repository page. You should see `README.md`, `data`, `hive`, `scripts`, and `docs`.

## Common Git errors
- **`remote origin already exists`:** run `git remote -v`; if it points to the wrong repository, use `git remote set-url origin https://github.com/YOUR-USERNAME/employee-salary-analytics-hive.git`.
- **`src refspec main does not match any`:** make sure you created a commit with `git add .` and `git commit ...`.
- **Authentication failed:** use GitHub's browser sign-in flow or a supported credential manager. GitHub account passwords are not accepted for HTTPS Git pushes; never share a token or password in chat.
- **Push rejected / remote contains work:** run `git pull --rebase origin main`, resolve any conflicts, then `git push -u origin main`. If you created a README on GitHub, this may be the cause.

## Academic note
This is a starter project. Add your own screenshots of Hive table creation and query output, and write your observations in the report outline before submitting.
