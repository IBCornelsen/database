import { Field, ObjectType, Int } from 'type-graphql'
import { TYPEdocumenttemplatesGQL } from './documenttemplates'

@ObjectType()
export class TYPEdocumenttypesGQL {
  @Field((_type) => Int)
  id: number

  @Field()
  name: string

  @Field()
  shortdescription: string

  @Field()
  longdescription: string

  @Field((_type) => [TYPEdocumenttemplatesGQL])
  documenttemplates: TYPEdocumenttemplatesGQL[]

  // skip overwrite 👇