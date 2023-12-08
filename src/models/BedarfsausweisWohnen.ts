import { Field, ObjectType, Int, Float } from 'type-graphql'
import { TYPEBenutzerGQL } from './Benutzer'
import { TYPEGebaeudeStammdatenGQL } from './GebaeudeStammdaten'
import { TYPERechnungenGQL } from './Rechnungen'

@ObjectType()
export class TYPEBedarfsausweisWohnenGQL {
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

  @Field()
  ausweisart: string

  @Field({ nullable: true })
  erstellungsdatum?: Date

  @Field()
  ausstellgrund: string

  @Field({ nullable: true })
  registriernummer?: string

  @Field({ nullable: true })
  erledigt?: boolean

  @Field({ nullable: true })
  saniert?: boolean

  @Field((_type) => [Int])
  baujahr: number[]

  @Field((_type) => Int, { nullable: true })
  einheiten?: number

  @Field((_type) => Int, { nullable: true })
  wohnflaeche?: number

  @Field({ nullable: true })
  keller_beheizt?: boolean

  @Field((_type) => Int, { nullable: true })
  dachgeschoss_beheizt?: number

  @Field({ nullable: true })
  lueftungskonzept?: string

  @Field((_type) => Float, { nullable: true })
  leerstand?: number

  @Field((_type) => Int, { nullable: true })
  versorgungssysteme?: number

  @Field((_type) => Int, { nullable: true })
  fenster_dach?: number

  @Field((_type) => Int, { nullable: true })
  energiequelle_2_nutzung?: number

  @Field((_type) => Int, { nullable: true })
  daemmung?: number

  @Field((_type) => Int, { nullable: true })
  anzahl_vollgeschosse?: number

  @Field((_type) => Float, { nullable: true })
  geschosshoehe?: number

  @Field((_type) => Int, { nullable: true })
  anzahl_gauben?: number

  @Field((_type) => Float, { nullable: true })
  breite_gauben?: number

  @Field((_type) => Float, { nullable: true })
  masse_a?: number

  @Field((_type) => Float, { nullable: true })
  masse_b?: number

  @Field((_type) => Float, { nullable: true })
  masse_c?: number

  @Field((_type) => Float, { nullable: true })
  masse_d?: number

  @Field((_type) => Float, { nullable: true })
  masse_e?: number

  @Field((_type) => Float, { nullable: true })
  masse_f?: number

  @Field((_type) => Float, { nullable: true })
  fensterflaeche_so_sw?: number

  @Field((_type) => Float, { nullable: true })
  fensterflaeche_nw_no?: number

  @Field((_type) => Float, { nullable: true })
  aussenwandflaeche_unbeheizt?: number

  @Field((_type) => Float, { nullable: true })
  dachflaeche?: number

  @Field((_type) => Float, { nullable: true })
  deckenflaeche?: number

  @Field((_type) => Float, { nullable: true })
  dach_u_wert?: number

  @Field((_type) => Float, { nullable: true })
  decke_u_wert?: number

  @Field((_type) => Float, { nullable: true })
  aussenwand_flaeche?: number

  @Field((_type) => Float, { nullable: true })
  aussenwand_u_wert?: number

  @Field((_type) => Float, { nullable: true })
  fussboden_flaeche?: number

  @Field((_type) => Float, { nullable: true })
  fussboden_u_wert?: number

  @Field((_type) => Float, { nullable: true })
  volumen?: number

  @Field({ nullable: true })
  dicht?: boolean

  @Field((_type) => Float, { nullable: true })
  fenster_flaeche_1?: number

  @Field((_type) => Float, { nullable: true })
  fenster_art_1?: number

  @Field((_type) => Float, { nullable: true })
  fenster_flaeche_2?: number

  @Field((_type) => Float, { nullable: true })
  fenster_art_2?: number

  @Field((_type) => Float, { nullable: true })
  dachfenster_flaeche?: number

  @Field((_type) => Float, { nullable: true })
  dachfenster_art?: number

  @Field((_type) => Float, { nullable: true })
  haustuer_flaeche?: number

  @Field((_type) => Float, { nullable: true })
  haustuer_art?: number

  @Field({ nullable: true })
  dach_bauart?: string

  @Field({ nullable: true })
  decke_bauart?: string

  @Field((_type) => Float, { nullable: true })
  dach_daemmung?: number

  @Field((_type) => Float, { nullable: true })
  decke_daemmung?: number

  @Field((_type) => Float, { nullable: true })
  aussenwand_daemmung?: number

  @Field((_type) => Float, { nullable: true })
  boden_daemmung?: number

  @Field({ nullable: true })
  aussenwand_bauart?: string

  @Field({ nullable: true })
  boden_bauart?: string

  @Field({ nullable: true })
  warmwasser_verteilung?: string

  @Field({ nullable: true })
  warmwasser_speicherung?: string

  @Field({ nullable: true })
  warmwasser_erzeugung?: string

  @Field({ nullable: true })
  heizung_zentral?: boolean

  @Field({ nullable: true })
  heizung_verteilung?: string

  @Field({ nullable: true })
  heizung_speicherung?: string

  @Field({ nullable: true })
  waerme_erzeugung_heizung?: string

  @Field((_type) => Float, { nullable: true })
  anteil_zusatzheizung?: number

  @Field((_type) => Float, { nullable: true })
  kollektor_flaeche?: number

  @Field((_type) => Float, { nullable: true })
  vanw_stromverbrauch_enthalten?: number

  @Field({ nullable: true })
  wird_gekuehlt?: boolean

  @Field((_type) => TYPEBenutzerGQL)
  benutzer: TYPEBenutzerGQL

  @Field((_type) => TYPEGebaeudeStammdatenGQL)
  gebaeude_stammdaten: TYPEGebaeudeStammdatenGQL

  @Field((_type) => TYPERechnungenGQL, { nullable: true })
  rechnungen?: TYPERechnungenGQL

  // skip overwrite 👇