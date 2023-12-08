import { Field, ObjectType, Int } from 'type-graphql'
import { TYPEBenutzerGQL } from './Benutzer'
import { TYPEGebaeudeStammdatenGQL } from './GebaeudeStammdaten'

@ObjectType()
export class TYPEAnteilshaberGQL {
  @Field((_type) => Int)
  id: number

  @Field((_type) => Int)
  benutzer_id: number

  @Field((_type) => Int)
  gebaeude_id: number

  @Field({ nullable: true })
  rolle?: string

  @Field({ nullable: true })
  privilegien?: number

  @Field({ nullable: true })
  uid?: string

  @Field((_type) => TYPEBenutzerGQL)
  benutzer: TYPEBenutzerGQL

  @Field((_type) => TYPEGebaeudeStammdatenGQL)
  gebaeude_stammdaten: TYPEGebaeudeStammdatenGQL

  // skip overwrite 👇