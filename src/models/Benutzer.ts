import { Field, ObjectType, Int } from 'type-graphql'
import { TYPEAdressenGQL } from './Adressen'
import { TYPEBedarfsausweisWohnenGQL } from './BedarfsausweisWohnen'
import { TYPEdocumenttemplatesGQL } from './documenttemplates'
import { TYPEGebaeudeStammdatenGQL } from './GebaeudeStammdaten'
import { TYPERechnungenGQL } from './Rechnungen'
import { TYPEtokensGQL } from './tokens'
import { TYPEVerbrauchsausweisGewerbeGQL } from './VerbrauchsausweisGewerbe'
import { TYPEVerbrauchsausweisWohnenGQL } from './VerbrauchsausweisWohnen'

@ObjectType()
export class TYPEBenutzerGQL {
  @Field((_type) => Int)
  id: number

  @Field({ nullable: true })
  name?: string

  @Field({ nullable: true })
  vorname?: string

  @Field()
  email: string

  @Field()
  passwort: string

  @Field({ nullable: true })
  profilbild?: string

  @Field((_type) => Int, { nullable: true })
  benutzer_adresse_id?: number

  @Field((_type) => Int, { nullable: true })
  rechnung_adresse_id?: number

  @Field((_type) => Int, { nullable: true })
  versand_adresse_id?: number

  @Field({ nullable: true })
  uid?: string

  @Field((_type) => [TYPEAdressenGQL])
  adressen_adressen_benutzer_idTobenutzer: TYPEAdressenGQL[]

  @Field((_type) => [TYPEBedarfsausweisWohnenGQL])
  bedarfsausweis_wohnen: TYPEBedarfsausweisWohnenGQL[]

  @Field((_type) => TYPEAdressenGQL, { nullable: true })
  adressen_benutzer_rechnung_adresse_idToadressen?: TYPEAdressenGQL

  @Field((_type) => TYPEAdressenGQL, { nullable: true })
  adressen_benutzer_benutzer_adresse_idToadressen?: TYPEAdressenGQL

  @Field((_type) => TYPEAdressenGQL, { nullable: true })
  adressen_benutzer_versand_adresse_idToadressen?: TYPEAdressenGQL

  @Field((_type) => [TYPEdocumenttemplatesGQL])
  documenttemplates: TYPEdocumenttemplatesGQL[]

  @Field((_type) => [TYPEGebaeudeStammdatenGQL])
  gebaeude_stammdaten: TYPEGebaeudeStammdatenGQL[]

  @Field((_type) => [TYPERechnungenGQL])
  rechnungen: TYPERechnungenGQL[]

  @Field((_type) => [TYPEtokensGQL])
  tokens: TYPEtokensGQL[]

  @Field((_type) => [TYPEVerbrauchsausweisGewerbeGQL])
  VerbrauchsausweisGewerbe: TYPEVerbrauchsausweisGewerbeGQL[]

  @Field((_type) => [TYPEVerbrauchsausweisWohnenGQL])
  VerbrauchsausweisWohnen: TYPEVerbrauchsausweisWohnenGQL[]

  // skip overwrite 👇