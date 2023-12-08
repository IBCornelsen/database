import { Field, ObjectType, Int, Float } from 'type-graphql'
import { TYPEBenutzerGQL } from './Benutzer'
import { TYPEGebaeudeStammdatenGQL } from './GebaeudeStammdaten'
import { TYPERechnungenGQL } from './Rechnungen'

@ObjectType()
export class TYPEVerbrauchsausweisWohnenGQL {
  @Field((_type) => Int)
  id: number

  @Field()
  uid: string

  @Field((_type) => Int)
  gebaeude_stammdaten_id: number

  @Field((_type) => Int)
  benutzer_id: number

  @Field((_type) => Int, { nullable: true })
  rechnungen_id?: number

  @Field({ nullable: true })
  erstellungsdatum?: Date

  @Field({ nullable: true })
  ausstellgrund?: string

  @Field({ nullable: true })
  registriernummer?: string

  @Field({ nullable: true })
  erledigt?: boolean

  @Field((_type) => [Int])
  baujahr_heizung: number[]

  @Field({ nullable: true })
  zusaetzliche_heizquelle?: boolean

  @Field({ nullable: true })
  brennstoff_1?: string

  @Field({ nullable: true })
  einheit_1?: string

  @Field({ nullable: true })
  brennstoff_2?: string

  @Field({ nullable: true })
  einheit_2?: string

  @Field({ nullable: true })
  startdatum?: Date

  @Field({ nullable: true })
  enddatum?: Date

  @Field((_type) => Int, { nullable: true })
  verbrauch_1?: number

  @Field((_type) => Int, { nullable: true })
  verbrauch_2?: number

  @Field((_type) => Int, { nullable: true })
  verbrauch_3?: number

  @Field((_type) => Int, { nullable: true })
  verbrauch_4?: number

  @Field((_type) => Int, { nullable: true })
  verbrauch_5?: number

  @Field((_type) => Int, { nullable: true })
  verbrauch_6?: number

  @Field({ nullable: true })
  warmwasser_enthalten?: boolean

  @Field((_type) => Float, { nullable: true })
  anteil_warmwasser_1?: number

  @Field((_type) => Float, { nullable: true })
  anteil_warmwasser_2?: number

  @Field((_type) => TYPEBenutzerGQL)
  benutzer: TYPEBenutzerGQL

  @Field((_type) => TYPEGebaeudeStammdatenGQL)
  gebaeude_stammdaten: TYPEGebaeudeStammdatenGQL

  @Field((_type) => TYPERechnungenGQL, { nullable: true })
  rechnungen?: TYPERechnungenGQL

  // skip overwrite 👇