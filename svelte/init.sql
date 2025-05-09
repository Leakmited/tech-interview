-- Create users table
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create departments table
CREATE TABLE IF NOT EXISTS departments (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100)
);

-- Create projects table
CREATE TABLE IF NOT EXISTS projects (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    start_date DATE,
    end_date DATE,
    department_id INTEGER REFERENCES departments(id)
);

-- Create user_projects junction table (many-to-many relationship)
CREATE TABLE IF NOT EXISTS user_projects (
    user_id INTEGER REFERENCES users(id),
    project_id INTEGER REFERENCES projects(id),
    role VARCHAR(50),
    joined_date DATE DEFAULT CURRENT_DATE,
    PRIMARY KEY (user_id, project_id)
);

-- Create tasks table
CREATE TABLE IF NOT EXISTS tasks (
    id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    status VARCHAR(50) DEFAULT 'pending',
    priority INTEGER DEFAULT 1,
    project_id INTEGER REFERENCES projects(id),
    assigned_to INTEGER REFERENCES users(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    due_date DATE
);

-- Insert sample data into departments
INSERT INTO departments (name, location) VALUES
    ('Engineering', 'Floor 1'),
    ('Marketing', 'Floor 2'),
    ('Sales', 'Floor 3'),
    ('HR', 'Floor 4');

-- Insert sample data into users
INSERT INTO users (name, email) VALUES
    ('Alice Johnson', 'alice@example.com'),
    ('Bob Smith', 'bob@example.com'),
    ('Carol White', 'carol@example.com'),
    ('David Brown', 'david@example.com'),
    ('Eva Green', 'eva@example.com');

-- Insert sample data into projects
INSERT INTO projects (name, description, start_date, end_date, department_id) VALUES
    ('Website Redesign', 'Modernize company website', '2024-01-01', '2024-06-30', 1),
    ('Mobile App', 'Develop new mobile application', '2024-02-01', '2024-08-31', 1),
    ('Marketing Campaign', 'Q2 Marketing campaign', '2024-03-01', '2024-05-31', 2),
    ('Sales Training', 'New sales team training program', '2024-01-15', '2024-04-15', 3);

-- Assign users to projects
INSERT INTO user_projects (user_id, project_id, role) VALUES
    (1, 1, 'Project Manager'),
    (2, 1, 'Developer'),
    (3, 1, 'Designer'),
    (1, 2, 'Developer'),
    (4, 2, 'Project Manager'),
    (5, 3, 'Marketing Lead'),
    (2, 3, 'Content Writer'),
    (3, 4, 'Trainer'),
    (4, 4, 'Coordinator');

-- Create sample tasks
INSERT INTO tasks (title, description, status, priority, project_id, assigned_to, due_date) VALUES
    ('Design Homepage', 'Create new homepage layout', 'in_progress', 2, 1, 3, '2024-04-15'),
    ('Implement API', 'Develop REST API endpoints', 'pending', 1, 2, 1, '2024-05-01'),
    ('Create Social Media Content', 'Design social media posts', 'completed', 3, 3, 5, '2024-03-15'),
    ('Prepare Training Materials', 'Create training documentation', 'in_progress', 2, 4, 3, '2024-04-01'),
    ('Database Optimization', 'Optimize database queries', 'pending', 1, 1, 2, '2024-04-30');

-- Create a view for project details
CREATE VIEW project_details AS
SELECT 
    p.id as project_id,
    p.name as project_name,
    d.name as department_name,
    COUNT(DISTINCT up.user_id) as team_size,
    COUNT(t.id) as total_tasks,
    COUNT(CASE WHEN t.status = 'completed' THEN 1 END) as completed_tasks
FROM projects p
LEFT JOIN departments d ON p.department_id = d.id
LEFT JOIN user_projects up ON p.id = up.project_id
LEFT JOIN tasks t ON p.id = t.project_id
GROUP BY p.id, p.name, d.name;

-- Create a view for user workload
CREATE VIEW user_workload AS
SELECT 
    u.id as user_id,
    u.name as user_name,
    COUNT(DISTINCT up.project_id) as active_projects,
    COUNT(t.id) as assigned_tasks,
    COUNT(CASE WHEN t.status = 'completed' THEN 1 END) as completed_tasks
FROM users u
LEFT JOIN user_projects up ON u.id = up.user_id
LEFT JOIN tasks t ON u.id = t.assigned_to
GROUP BY u.id, u.name;