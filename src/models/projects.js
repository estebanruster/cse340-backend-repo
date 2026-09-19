import db from './db.js'

const getAllProjects = async () => {
    const query = `
        SELECT project_id, title, public.project.description, location, TO_CHAR(date, 'YYYY-MM-DD') AS display_date, public.project.organization_id, name
        FROM public.project
        JOIN public.organization ON public.project.organization_id = public.organization.organization_id;
    `;

    const result = await db.query(query);

    return result.rows;
}

export { getAllProjects }