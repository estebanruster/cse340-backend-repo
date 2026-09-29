import db from './db.js'

const getAllProjects = async () => {
    const query = `
        SELECT project_id, title, public.project.description, location, TO_CHAR(date, 'YYYY-MM-DD') AS display_date, public.project.organization_id, name
        FROM public.project
        JOIN public.organization ON public.project.organization_id = public.organization.organization_id;
    `;

    const result = await db.query(query);

    return result.rows;
};

const getProjectsByOrganizationId = async (organizationId) => {
    const query = `
        SELECT
          project_id,
          organization_id,
          title,
          description,
          location,
          date
        FROM project
        WHERE organization_id = $1
        ORDER BY date;
      `;

    const queryParams = [organizationId];
    const result = await db.query(query, queryParams);

    return result.rows;
};

const getUpcomingProjects = async (number_of_projects) => {
    const query = `
        SELECT project_id, title, public.project.description, location, TO_CHAR(date, 'YYYY-MM-DD') AS display_date, public.project.organization_id, name
        FROM public.project
        JOIN public.organization ON public.project.organization_id = public.organization.organization_id
        WHERE date >= CURRENT_DATE
        ORDER BY date ASC
        LIMIT $1;
    `;

    const queryParams = [number_of_projects];
    const result = await db.query(query, queryParams);

    return result.rows;
};

const getProjectDetails = async (id) => {
    const query = `
        SELECT project_id, title, public.project.description, location, TO_CHAR(date, 'YYYY-MM-DD') AS display_date, public.project.organization_id, name
        FROM public.project
        JOIN public.organization ON public.project.organization_id = public.organization.organization_id
        WHERE project_id = $1;
    `;

    const queryParams = [id];
    const result = await db.query(query, queryParams);

    // Return the first row of the result set, or null if no rows are found
    return result.rows.length > 0 ? result.rows[0] : null;
};

export { getAllProjects, getProjectsByOrganizationId, getUpcomingProjects, getProjectDetails };