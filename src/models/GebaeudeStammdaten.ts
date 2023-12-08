import { Field, ObjectType, Int } from 'type-graphql'
import { TYPEBedarfsausweisWohnenGQL } from './BedarfsausweisWohnen'
import { TYPEGebaeudeBilderGQL } from './GebaeudeBilder'
import { TYPEGebaeudePlaeneGQL } from './GebaeudePlaene'
import { TYPEBenutzerGQL } from './Benutzer'
import { TYPEAdressenGQL } from './Adressen'
import { TYPEVerbrauchsausweisGewerbeGQL } from './VerbrauchsausweisGewerbe'
import { TYPEVerbrauchsausweisWohnenGQL } from './VerbrauchsausweisWohnen'

@ObjectType()
export class TYPEGebaeudeStammdatenGQL {
  @Field((_type) => Int)
  id: number

  @Field()
  uid: string

  @Field((_type) => Int, { nullable: true })
  benutzer_id?: number

  @Field((_type) => Int, { nullable: true })
  gebaeude_adresse_id?: number

  @Field({ nullable: true })
  gebaeudetyp?: string

  @Field({ nullable: true })
  gebaeudeteil?: string

  @Field((_type) => [Int])
  baujahr_gebaeude: number[]

  @Field({ nullable: true })
  baujahr_heizung?: string

  @Field({ nullable: true })
  baujahr_klima?: string

  @Field((_type) => Int, { nullable: true })
  einheiten?: number

  @Field((_type) => Int, { nullable: true })
  flaeche?: number

  @Field({ nullable: true })
  saniert?: boolean

  @Field((_type) => Int, { nullable: true })
  keller?: number

  @Field((_type) => Int, { nullable: true })
  dachgeschoss?: number

  @Field({ nullable: true })
  lueftung?: string

  @Field({ nullable: true })
  kuehlung?: string

  @Field((_type) => Int, { nullable: true })
  leerstand?: number

  @Field((_type) => [TYPEBedarfsausweisWohnenGQL])
  bedarfsausweis_wohnen: TYPEBedarfsausweisWohnenGQL[]

  @Field((_type) => [TYPEGebaeudeBilderGQL])
  gebaeude_bilder: TYPEGebaeudeBilderGQL[]

  @Field((_type) => [TYPEGebaeudePlaeneGQL])
  gebaeude_plaene: TYPEGebaeudePlaeneGQL[]

  @Field((_type) => TYPEBenutzerGQL, { nullable: true })
  benutzer?: TYPEBenutzerGQL

  @Field((_type) => TYPEAdressenGQL, { nullable: true })
  adressen?: TYPEAdressenGQL

  @Field((_type) => [TYPEVerbrauchsausweisGewerbeGQL])
  VerbrauchsausweisGewerbe: TYPEVerbrauchsausweisGewerbeGQL[]

  @Field((_type) => [TYPEVerbrauchsausweisWohnenGQL])
  VerbrauchsausweisWohnen: TYPEVerbrauchsausweisWohnenGQL[]

  // skip overwrite 👇