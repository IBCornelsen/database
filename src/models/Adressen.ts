import { Field, ObjectType, Int } from 'type-graphql'
import { TYPEBenutzerGQL } from './Benutzer'
import { TYPEGebaeudeStammdatenGQL } from './GebaeudeStammdaten'

@ObjectType()
export class TYPEAdressenGQL {
  @Field((_type) => Int)
  id: number

  @Field((_type) => Int)
  benutzer_id: number

  @Field()
  empfaenger_zeile_1: string

  @Field({ nullable: true })
  empfaenger_zeile_2?: string

  @Field()
  strasse: string

  @Field()
  plz: string

  @Field()
  ort: string

  @Field({ nullable: true })
  geolocation?: string

  @Field({ nullable: true })
  uid?: string

  @Field((_type) => TYPEBenutzerGQL)
  benutzer_adressen_benutzer_idTobenutzer: TYPEBenutzerGQL

  @Field((_type) => [TYPEBenutzerGQL])
  benutzer_benutzer_rechnung_adresse_idToadressen: TYPEBenutzerGQL[]

  @Field((_type) => [TYPEBenutzerGQL])
  benutzer_benutzer_benutzer_adresse_idToadressen: TYPEBenutzerGQL[]

  @Field((_type) => [TYPEBenutzerGQL])
  benutzer_benutzer_versand_adresse_idToadressen: TYPEBenutzerGQL[]

  @Field((_type) => [TYPEGebaeudeStammdatenGQL])
  gebaeude_stammdaten: TYPEGebaeudeStammdatenGQL[]

  // skip overwrite 👇