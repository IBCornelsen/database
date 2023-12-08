import { Field, ObjectType, Int } from 'type-graphql'
import { TYPEtokensGQL } from './tokens'

@ObjectType()
export class TYPETokenUsageGQL {
  @Field((_type) => Int)
  id: number

  @Field((_type) => Int)
  token_id: number

  @Field()
  date: Date

  @Field()
  resource_hash: string

  @Field((_type) => Int)
  payload_length: number

  @Field((_type) => Int)
  response_length: number

  @Field()
  response_success: boolean

  @Field((_type) => Int)
  response_code: number

  @Field((_type) => TYPEtokensGQL)
  tokens: TYPEtokensGQL

  // skip overwrite 👇