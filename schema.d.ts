
interface Resume {
  version: 1,
  picture?: string,
  profil?: Profil,
  skills?: Skills[],
  interests?: Field<string[]>,
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

// TODO: Translation.
interface Profil {
  firstname?: string,
  lastname?: string,
  position?: Field<string>,
  description?: Field<string>,
  github?: string,
  email?: string,
  address?: string,
  phone?: string,
  age?: string,
}

interface Skills {
  field: Field<string>,
  skills: Field<string>[],
}

interface Experience {
  months?: Field<number>,
  start?: Field<number>,
  stop?: Field<number>,
  company?: Field<string>,
  position?: Field<string>,
  description?: Field<string[]>,

  // Vertically aligns "company" and "position".
  break?: boolean,
}

interface Education {
  start?: Field<number>,
  stop?: Field<number>,
  school?: Field<string>,
  schooling?: Field<string>,
  description?: Field<string[]>,

  // Vertically aligns "school" and "schooling".
  break?: boolean,
}

interface Project {
  start?: Field<number>,
  stop?: Field<number>,
  title?: Field<string>,
  repository?: Field<string>,
  description?: Field<string[]>,
}
