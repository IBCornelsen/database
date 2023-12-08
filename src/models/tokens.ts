import { Field, ObjectType, Int } from 'type-graphql'
import { TYPETokenUsageGQL } from './TokenUsage'
import { TYPEBenutzerGQL } from './Benutzer'

@ObjectType()
export class TYPEtokensGQL {
  @Field((_type) => Int)
  id: number

  @Field()
  token: string

  @Field((_type) => Int)
  user_id: number

  @Field()
  date_created: Date

  @Field()
  last_used: Date

  @Field((_type) => Int)
  times_used: number

  @Field((_type) => Int)
  permissions: number

  @Field((_type) => [TYPETokenUsageGQL])
  token_usage: TYPETokenUsageGQL[]

  @Field((_type) => TYPEBenutzerGQL)
  benutzer: TYPEBenutzerGQL

  // skip overwrite 👇