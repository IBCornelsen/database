import { Field, ObjectType, Int } from 'type-graphql'
import { TYPEBenutzerGQL } from './Benutzer'
import { TYPEdocumenttypesGQL } from './documenttypes'

@ObjectType()
export class TYPEdocumenttemplatesGQL {
  @Field((_type) => Int)
  id: number

  @Field()
  name: string

  @Field()
  shortdescription: string

  @Field()
  longdescription: string

  @Field((_type) => Int)
  user_id: number

  @Field()
  is_private: boolean

  @Field((_type) => Int)
  documenttype: number

  @Field()
  filename: string

  @Field()
  created_at: Date

  @Field()
  updated_at: Date

  @Field((_type) => TYPEBenutzerGQL)
  benutzer: TYPEBenutzerGQL

  @Field((_type) => TYPEdocumenttypesGQL)
  documenttypes: TYPEdocumenttypesGQL

  // skip overwrite 👇