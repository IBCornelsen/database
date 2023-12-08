import { Field, ObjectType, Int } from 'type-graphql'

@ObjectType()
export class TYPEPostleitzahlenGQL {
  @Field((_type) => Int)
  id: number

  // skip overwrite 👇