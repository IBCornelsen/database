import { Field, ObjectType, Int } from 'type-graphql'
import { TYPEBenutzerGQL } from './Benutzer'
import { TYPEGebaeudeStammdatenGQL } from './GebaeudeStammdaten'
import { TYPERechnungenGQL } from './Rechnungen'

@ObjectType()
export class TYPEVerbrauchsausweisGewerbeGQL {
  @Field((_type) => Int)
  id: number

  @Field()
  uid: string

  @Field((_type) => Int)
  gebaeude_stammdaten_id: number

  @Field((_type) => Int, { nullable: true })
  rechnungen_id?: number

  @Field((_type) => Int)
  benutzer_id: number

  @Field((_type) => TYPEBenutzerGQL)
  benutzer: TYPEBenutzerGQL

  @Field((_type) => TYPEGebaeudeStammdatenGQL)
  gebaeude_stammdaten: TYPEGebaeudeStammdatenGQL

  @Field((_type) => TYPERechnungenGQL, { nullable: true })
  rechnungen?: TYPERechnungenGQL

  // skip overwrite 👇