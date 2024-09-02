
interface Resume {
  version: 1,
  picture?: string,
  profil?: Profil,
  skills?: Skills[],
  interests?: string[],
  experiences?: Experience[],
  educations?: Education[],
  projects?: Project[],
}

type Field<Type = string> = Type | Translation<Type>

interface Translation<Type = string> {
  en?: Type,
  fr?: Type,
}

// ╔═╗┬┌─┐┬  ┌┬┐┌─┐
// ╠╣ │├┤ │   ││└─┐
// ╚  ┴└─┘┴─┘╶┴┘└─┘

interface Profil {
  firstname?: string,
  lastname?: string,
  position?: string,
  description?: string,
  github?: string,
  email?: string,
  address?: string,
  phone?: string,
  age?: string,
}

interface Skills {
  field: string,
  skills: string[],
}

interface Experience {
  months?: number,
  start?: number,
  stop?: number,
  company?: Field<string>,
  position?: Field<string>,
  description?: Field<string[]>,

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
