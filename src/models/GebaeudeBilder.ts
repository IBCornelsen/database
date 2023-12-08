import { Field, ObjectType, Int } from 'type-graphql'
import { TYPEGebaeudeStammdatenGQL } from './GebaeudeStammdaten'

@ObjectType()
export class TYPEGebaeudeBilderGQL {
  @Field((_type) => Int)
  id: number

  @Field((_type) => Int)
  gebaeude_stammdaten_id: number

  @Field()
  kategorie: string

  @Field()
  uid: string

  @Field((_type) => TYPEGebaeudeStammdatenGQL)
  gebaeude_stammdaten: TYPEGebaeudeStammdatenGQL

  // skip overwrite 👇