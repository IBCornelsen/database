import { Field, ObjectType, Int } from 'type-graphql'
import { TYPEBedarfsausweisWohnenGQL } from './BedarfsausweisWohnen'
import { TYPEBenutzerGQL } from './Benutzer'
import { TYPEVerbrauchsausweisGewerbeGQL } from './VerbrauchsausweisGewerbe'
import { TYPEVerbrauchsausweisWohnenGQL } from './VerbrauchsausweisWohnen'

@ObjectType()
export class TYPERechnungenGQL {
  @Field((_type) => Int)
  id: number

  @Field((_type) => Int)
  benutzer_id: number

  @Field({ nullable: true })
  empfaenger_zeile_1?: string

  @Field({ nullable: true })
  empfaenger_zeile_2?: string

  @Field()
  strasse: string

  @Field({ nullable: true })
  plz?: string

  @Field({ nullable: true })
  ort?: string

  @Field()
  uid: string

  @Field((_type) => [TYPEBedarfsausweisWohnenGQL])
  bedarfsausweis_wohnen: TYPEBedarfsausweisWohnenGQL[]

  @Field((_type) => TYPEBenutzerGQL)
  benutzer: TYPEBenutzerGQL

  @Field((_type) => [TYPEVerbrauchsausweisGewerbeGQL])
  VerbrauchsausweisGewerbe: TYPEVerbrauchsausweisGewerbeGQL[]

  @Field((_type) => [TYPEVerbrauchsausweisWohnenGQL])
  VerbrauchsausweisWohnen: TYPEVerbrauchsausweisWohnenGQL[]

  // skip overwrite 👇