
interface Resume {
  version: 1,
  lang?: string,
  picture?: string,
  profil?: Profil,
  skills?: Skills[],
  interests?: string[],
  experiences?: Experience[],
  educations?: Education[],
  projects?: Project[],
}

// ╔═╗┬┌─┐┬  ┌┬┐┌─┐
// ╠╣ │├┤ │   ││└─┐
// ╚  ┴└─┘┴─┘╶┴┘└─┘

interface Profil {
  firstname?: string,
  lastname?: string,
  position?: string,
  github?: string,
  age?: string,
  email?: string,
  phone?: string,
  address?: string,
}

interface Skills {
  field: string,
  skills: string[],
}

interface Experience {
  months?: number,
  start?: number,
  stop?: number,
  company?: string,
  position?: string,
  description?: string[],

  // Vertically aligns "company" and "position".
  break?: boolean,
}

interface Education {
  start?: number,
  stop?: number,
  school?: string,
  schooling?: string,
  description?: string[],

  // Vertically aligns "school" and "schooling".
  break?: boolean,
}

interface Project {
  start?: number,
  stop?: number,
  title?: string,
  repository?: string,
  description?: string[],
}
