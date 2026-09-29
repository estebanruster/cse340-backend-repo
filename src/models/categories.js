import db from './db.js'

const getAllCategories = async () => {
  const query = `
      SELECT category_id, category_name
      FROM public.category;
    `;

  const result = await db.query(query);

  return result.rows;
};

const getCategoryDetails = async (categoryId) => {
  const query = `
      SELECT category_id, category_name
      FROM category
      WHERE category_id = $1;
    `;

  const queryParams = [categoryId];
  const result = await db.query(query, queryParams);

  // Return the first row of the result set, or null if no rows are found
  return result.rows.length > 0 ? result.rows[0] : null;
};

const getCategoriesByProjectId = async (projectId) => {
  const query = `
      SELECT
        p.project_id,
        p.title,
        c.category_id,
        c.category_name
      FROM project p
      JOIN project_has_category phc
        ON p.project_id = phc.project_id
      JOIN category c
        ON phc.category_id = c.category_id
      WHERE p.project_id = $1
      ORDER BY c.category_name;
    `;

  const queryParams = [projectId];
  const result = await db.query(query, queryParams);

  return result.rows;
};

export { getAllCategories, getCategoryDetails, getCategoriesByProjectId };