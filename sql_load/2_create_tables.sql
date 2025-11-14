-- Create company_dim table with primary key
-- company_dim: primary keys currently assumed present in CSV. If you want DB-generated IDs, replace INT with SERIAL or use IDENTITY.
CREATE TABLE IF NOT EXISTS public.company_dim
(
    company_id INT PRIMARY KEY,
    name TEXT,
    link TEXT,
    link_google TEXT,
    thumbnail TEXT
);

-- Create skills_dim table with primary key
CREATE TABLE IF NOT EXISTS public.skills_dim
(
    skill_id INT PRIMARY KEY,
    skills TEXT,
    type TEXT
);

-- Create job_postings_fact table with primary key
CREATE TABLE IF NOT EXISTS public.job_postings_fact
(
    job_id INT PRIMARY KEY,
    company_id INT,
    job_title_short VARCHAR(255),
    job_title TEXT,
    job_location TEXT,
    job_via TEXT,
    job_schedule_type TEXT,
    job_work_from_home BOOLEAN,
    search_location TEXT,
    job_posted_date TIMESTAMP,
    job_no_degree_mention BOOLEAN,
    job_health_insurance BOOLEAN,
    job_country TEXT,
    salary_rate TEXT,
    salary_year_avg NUMERIC,
    salary_hour_avg NUMERIC,
    CONSTRAINT fk_job_company FOREIGN KEY (company_id) REFERENCES public.company_dim (company_id)
);

-- Create skills_job_dim table with a composite primary key and foreign keys
CREATE TABLE IF NOT EXISTS public.skills_job_dim
(
    job_id INT,
    skill_id INT,
    PRIMARY KEY (job_id, skill_id),
    CONSTRAINT fk_skills_job_job FOREIGN KEY (job_id) REFERENCES public.job_postings_fact (job_id),
    CONSTRAINT fk_skills_job_skill FOREIGN KEY (skill_id) REFERENCES public.skills_dim (skill_id)
);

-- ALTER TABLE ... OWNER statements removed/commented out to avoid permission errors when running as a non-superuser
-- ALTER TABLE public.company_dim OWNER to postgres;
-- ALTER TABLE public.skills_dim OWNER to postgres;
-- ALTER TABLE public.job_postings_fact OWNER to postgres;
-- ALTER TABLE public.skills_job_dim OWNER to postgres;

-- Create indexes on foreign key columns for better performance
CREATE INDEX IF NOT EXISTS idx_company_id ON public.job_postings_fact (company_id);
CREATE INDEX IF NOT EXISTS idx_skill_id ON public.skills_job_dim (skill_id);
CREATE INDEX IF NOT EXISTS idx_job_id ON public.skills_job_dim (job_id);