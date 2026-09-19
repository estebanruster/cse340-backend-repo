-- ========================================
-- Organization Table
-- ========================================
CREATE TABLE organization (
    organization_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    contact_email VARCHAR(255) NOT NULL,
    logo_filename VARCHAR(255) NOT NULL
);

-- ========================================
-- Service Project (project) Table
-- ========================================
CREATE TABLE project (
    project_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    date DATE NOT NULL,
    organization_id INTEGER,
    FOREIGN KEY (organization_id) REFERENCES organization (organization_id)
);

-- ========================================
-- Category Table
-- ========================================
CREATE TABLE category (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(75) NOT NULL
);

-- ========================================
-- project_has_category "junction" Table
-- ========================================
CREATE TABLE project_has_category (
    project_id INTEGER,
	category_id INTEGER,
    PRIMARY KEY (project_id, category_id),
    FOREIGN KEY (project_id) REFERENCES project (project_id),
	FOREIGN KEY (category_id) REFERENCES category (category_id)
);

-- ========================================
-- Inserting organization data
-- ========================================
INSERT INTO organization VALUES
	(default, 'BrightFuture Builders', 'A nonprofit focused on improving community infrastructure through sustainable construction projects.', 'info@brightfuturebuilders.org', 'brightfuture-logo.png'),
	(default, 'GreenHarvest Growers', 'An urban farming collective promoting food sustainability and education in local neighborhoods.', 'contact@greenharvest.org', 'greenharvest-logo.png'),
	(default, 'UnityServe Volunteers', 'A volunteer coordination group supporting local charities and service initiatives.', 'hello@unityserve.org', 'unityserve-logo.png');

-- ========================================
-- Inserting project data
-- ========================================
INSERT INTO project (title, description, location, date, organization_id)
VALUES
-- Projects for organization_id = 1
(
    'Community Food Drive',
    'Organized a city-wide food collection campaign for low-income families.',
    'Queretaro, Mexico',
    '2026-05-25',
    1
),
(
    'School Supplies Donation',
    'Provided school materials and backpacks to children in rural communities.',
    'San Juan del Rio, Mexico',
    '2026-06-05',
    1
),
(
    'Tree Planting Initiative',
    'Volunteers planted over 500 trees in public parks and green areas.',
    'Celaya, Mexico',
    '2026-06-18',
    1
),
(
    'Senior Care Visit Program',
    'Weekly visits and recreational activities for senior citizens.',
    'Queretaro, Mexico',
    '2026-07-02',
    1
),
(
    'Community Health Fair',
    'Free medical checkups and health education workshops for residents.',
    'Tequisquiapan, Mexico',
    '2026-07-15',
    1
),
-- Projects for organization_id = 2
(
    'Beach Cleanup Campaign',
    'Collected waste and promoted environmental awareness along the coastline.',
    'Cancun, Mexico',
    '2026-05-30',
    2
),
(
    'Youth Coding Workshop',
    'Introduced programming basics and web development to teenagers.',
    'Monterrey, Mexico',
    '2026-06-12',
    2
),
(
    'Homeless Shelter Support',
    'Prepared and distributed meals for homeless individuals.',
    'Guadalajara, Mexico',
    '2026-06-25',
    2
),
(
    'Animal Rescue Fundraiser',
    'Raised funds for veterinary care and adoption programs.',
    'Puebla, Mexico',
    '2026-07-08',
    2
),
(
    'Women Entrepreneurship Seminar',
    'Hosted workshops on business planning and financial literacy.',
    'Mexico City, Mexico',
    '2026-07-20',
    2
),
-- Projects for organization_id = 3
(
    'Water Conservation Awareness',
    'Educational campaign about reducing household water consumption.',
    'Leon, Mexico',
    '2026-05-28',
    3
),
(
    'Public Library Renovation',
    'Restored reading spaces and donated new educational materials.',
    'Toluca, Mexico',
    '2026-06-10',
    3
),
(
    'Free English Classes',
    'Provided beginner and intermediate English lessons for adults.',
    'Aguascalientes, Mexico',
    '2026-06-22',
    3
),
(
    'Neighborhood Sports Tournament',
    'Organized sports competitions to encourage community participation.',
    'Merida, Mexico',
    '2026-07-05',
    3
),
(
    'Digital Literacy Program',
    'Taught basic computer and internet skills to older adults.',
    'Tijuana, Mexico',
    '2026-07-18',
    3
);

-- ========================================
-- INSERTS FOR category TABLE
-- ========================================
INSERT INTO category (category_name)
VALUES
('Community Support'),
('Education & Skills Development'),
('Environment & Sustainability'),
('Animal Welfare'),
('Sports & Recreation'),
('Infrastructure & Public Spaces');

-- ========================================
-- INSERTS FOR project_has_category TABLE
-- ========================================
INSERT INTO project_has_category (project_id, category_id)
VALUES
-- Community Support (category_id = 1)
(1, 1),   -- Community Food Drive
(4, 1),   -- Senior Care Visit Program
(5, 1),   -- Community Health Fair
(8, 1),   -- Homeless Shelter Support
-- Education & Skills Development (category_id = 2)
(2, 2),   -- School Supplies Donation
(7, 2),   -- Youth Coding Workshop
(10, 2),  -- Women Entrepreneurship Seminar
(13, 2),  -- Free English Classes
(15, 2),  -- Digital Literacy Program
-- Environment & Sustainability (category_id = 3)
(3, 3),   -- Tree Planting Initiative
(6, 3),   -- Beach Cleanup Campaign
(11, 3),  -- Water Conservation Awareness
-- Animal Welfare (category_id = 4)
(9, 4),   -- Animal Rescue Fundraiser
-- Sports & Recreation (category_id = 5)
(14, 5),  -- Neighborhood Sports Tournament
-- Infrastructure & Public Spaces (category_id = 6)
(12, 6);  -- Public Library Renovation