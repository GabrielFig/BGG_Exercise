import 'dart:convert';
import 'package:app_doggys/dominio/problemas.dart';
import 'package:app_doggys/dominio/registro_raza.dart';
import 'package:app_doggys/dominio/varibale_dominio.dart';
import 'package:fpdart/fpdart.dart';

abstract class repositorioVerificacion {
  Either<Problema, RegistroRaza> obtenerRegistroRaza(NickFormado nick);
}

List campos = ['status', 'message'];

class RepositorioPruebasVerificacion extends repositorioVerificacion {
  final String _hound =
      """
<?xml version="1.0" encoding="utf-8"?><plays username="juandalf" userid="482490" total="5238" page="3" termsofuse="https://boardgamegeek.com/xmlapi/termsofuse">
<play id="61192236" date="2022-06-02" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Ouch!" objecttype="thing" objectid="352710">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="Hellogark" userid="1667501" name="Hellogark" startposition="" color="" score="14" new="0" rating="0" win="0" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="7" new="0" rating="0" win="0" />
						<player username="" userid="0" name="Nechiwero" startposition="" color="" score="20" new="0" rating="0" win="1" />
						</players>
					</play>
	<play id="61169999" date="2022-06-01" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Orchard: A 9 card solitaire game" objecttype="thing" objectid="245487">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="25" new="0" rating="0" win="1" />
						</players>
					</play>
	<play id="61170000" date="2022-06-01" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Orchard: A 9 card solitaire game" objecttype="thing" objectid="245487">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="31" new="0" rating="0" win="1" />
						</players>
					</play>
	<play id="61170003" date="2022-06-01" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Orchard: A 9 card solitaire game" objecttype="thing" objectid="245487">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="32" new="0" rating="0" win="1" />
						</players>
					</play>
	<play id="61170114" date="2022-06-01" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Orchard: A 9 card solitaire game" objecttype="thing" objectid="245487">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="23" new="0" rating="0" win="1" />
						</players>
					</play>
	<play id="61170953" date="2022-06-01" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Ouch!" objecttype="thing" objectid="352710">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="Azgarm" userid="1664533" name="Miguel Angel" startposition="" color="" score="25" new="1" rating="0" win="1" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="0" new="1" rating="0" win="0" />
						</players>
					</play>
	<play id="61170960" date="2022-06-01" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Ouch!" objecttype="thing" objectid="352710">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="Azgarm" userid="1664533" name="Miguel Angel" startposition="" color="" score="17" new="0" rating="0" win="1" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="8" new="0" rating="0" win="0" />
						</players>
					</play>
	<play id="61171392" date="2022-06-01" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Ouch!" objecttype="thing" objectid="352710">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="Azgarm" userid="1664533" name="Miguel Angel" startposition="" color="" score="19" new="0" rating="0" win="1" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="13" new="0" rating="0" win="0" />
						</players>
					</play>
	<play id="61171512" date="2022-06-01" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Ouch!" objecttype="thing" objectid="352710">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="" userid="0" name="Marcelita" startposition="" color="" score="26" new="1" rating="0" win="1" />
						<player username="Azgarm" userid="1664533" name="Miguel Angel" startposition="" color="" score="6" new="0" rating="0" win="0" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="6" new="0" rating="0" win="0" />
						</players>
					</play>
	<play id="61171689" date="2022-06-01" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Ouch!" objecttype="thing" objectid="352710">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="" userid="0" name="Diana Sofía" startposition="" color="" score="21" new="1" rating="0" win="0" />
						<player username="" userid="0" name="Marcelita" startposition="" color="" score="26" new="0" rating="0" win="1" />
						<player username="Azgarm" userid="1664533" name="Miguel Angel" startposition="" color="" score="24" new="0" rating="0" win="0" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="18" new="0" rating="0" win="0" />
						</players>
					</play>
	<play id="61147868" date="2022-05-31" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Orchard: A 9 card solitaire game" objecttype="thing" objectid="245487">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="39" new="0" rating="0" win="1" />
						</players>
					</play>
	<play id="61148072" date="2022-05-31" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Orchard: A 9 card solitaire game" objecttype="thing" objectid="245487">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="23" new="0" rating="0" win="1" />
						</players>
					</play>
	<play id="61148333" date="2022-05-31" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Orchard: A 9 card solitaire game" objecttype="thing" objectid="245487">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="25" new="0" rating="0" win="1" />
						</players>
					</play>
	<play id="61092018" date="2022-05-29" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Orchard: A 9 card solitaire game" objecttype="thing" objectid="245487">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="27" new="0" rating="0" win="1" />
						</players>
					</play>
	<play id="61092023" date="2022-05-29" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Orchard: A 9 card solitaire game" objecttype="thing" objectid="245487">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="29" new="0" rating="0" win="1" />
						</players>
					</play>
	<play id="61092497" date="2022-05-29" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Orchard: A 9 card solitaire game" objecttype="thing" objectid="245487">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="26" new="0" rating="0" win="1" />
						</players>
					</play>
	<play id="61092935" date="2022-05-29" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Orchard: A 9 card solitaire game" objecttype="thing" objectid="245487">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="35" new="0" rating="0" win="1" />
						</players>
					</play>
	<play id="61093304" date="2022-05-29" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Orchard: A 9 card solitaire game" objecttype="thing" objectid="245487">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="27" new="0" rating="0" win="1" />
						</players>
					</play>
	<play id="61093628" date="2022-05-29" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Orchard: A 9 card solitaire game" objecttype="thing" objectid="245487">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="40" new="0" rating="0" win="1" />
						</players>
					</play>
	<play id="61094037" date="2022-05-29" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Orchard: A 9 card solitaire game" objecttype="thing" objectid="245487">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="20" new="0" rating="0" win="1" />
						</players>
					</play>
	<play id="61094312" date="2022-05-29" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Orchard: A 9 card solitaire game" objecttype="thing" objectid="245487">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="32" new="0" rating="0" win="1" />
						</players>
					</play>
	<play id="61094655" date="2022-05-29" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Orchard: A 9 card solitaire game" objecttype="thing" objectid="245487">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="25" new="0" rating="0" win="1" />
						</players>
					</play>
	<play id="61094914" date="2022-05-29" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Orchard: A 9 card solitaire game" objecttype="thing" objectid="245487">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="31" new="0" rating="0" win="1" />
						</players>
					</play>
	<play id="61054744" date="2022-05-28" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Orchard: A 9 card solitaire game" objecttype="thing" objectid="245487">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="44" new="0" rating="0" win="1" />
						</players>
					</play>
	<play id="61055091" date="2022-05-28" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Orchard: A 9 card solitaire game" objecttype="thing" objectid="245487">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="44" new="0" rating="0" win="1" />
						</players>
					</play>
	<play id="61001296" date="2022-05-26" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Beasty Bar" objecttype="thing" objectid="165950">
				<subtypes>
										<subtype value="boardgame" />
										<subtype value="boardgameintegration" />
									</subtypes>
			</item>
									<players>
									<player username="fokuleh" userid="1518480" name="Fokuleh" startposition="" color="" score="" new="1" rating="0" win="0" />
						<player username="Hellogark" userid="1667501" name="Hellogark" startposition="" color="" score="" new="1" rating="0" win="0" />
						<player username="" userid="0" name="Nechiwero" startposition="" color="" score="" new="0" rating="0" win="0" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="" new="0" rating="0" win="1" />
						</players>
					</play>
	<play id="61004983" date="2022-05-26" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Cyclades" objecttype="thing" objectid="54998">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="Hellogark" userid="1667501" name="Hellogark" startposition="" color="" score="" new="1" rating="0" win="0" />
						<player username="" userid="0" name="Juan Carlos Rouge" startposition="" color="" score="" new="1" rating="0" win="0" />
						<player username="" userid="0" name="Nechiwero" startposition="" color="" score="" new="1" rating="0" win="0" />
						<player username="Vazquez" userid="2121508" name="Ulises Vazquez" startposition="" color="" score="" new="1" rating="0" win="0" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="" new="1" rating="0" win="1" />
						</players>
					</play>
	<play id="61002513" date="2022-05-26" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Excalibohn" objecttype="thing" objectid="313649">
				<subtypes>
										<subtype value="boardgame" />
										<subtype value="boardgameimplementation" />
									</subtypes>
			</item>
									<players>
									<player username="fokuleh" userid="1518480" name="Fokuleh" startposition="" color="" score="8" new="1" rating="0" win="0" />
						<player username="Hellogark" userid="1667501" name="Hellogark" startposition="" color="" score="6" new="1" rating="0" win="0" />
						<player username="" userid="0" name="Nechiwero" startposition="" color="" score="10" new="1" rating="0" win="1" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="10" new="1" rating="0" win="0" />
						</players>
					</play>
	<play id="61005375" date="2022-05-26" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Magic Maze" objecttype="thing" objectid="209778">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="" userid="0" name="Juan Carlos Rouge" startposition="" color="" score="" new="0" rating="0" win="1" />
						<player username="" userid="0" name="Nechiwero" startposition="" color="" score="" new="1" rating="0" win="1" />
						<player username="Vazquez" userid="2121508" name="Ulises Vazquez" startposition="" color="" score="" new="1" rating="0" win="1" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="" new="0" rating="0" win="1" />
						</players>
					</play>
	<play id="61005376" date="2022-05-26" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Magic Maze" objecttype="thing" objectid="209778">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="" userid="0" name="Juan Carlos Rouge" startposition="" color="" score="" new="0" rating="0" win="0" />
						<player username="" userid="0" name="Nechiwero" startposition="" color="" score="" new="0" rating="0" win="0" />
						<player username="Vazquez" userid="2121508" name="Ulises Vazquez" startposition="" color="" score="" new="0" rating="0" win="0" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="" new="0" rating="0" win="0" />
						</players>
					</play>
	<play id="61003912" date="2022-05-26" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Star Wars: Jabba&#039;s Palace – A Love Letter Game" objecttype="thing" objectid="353470">
				<subtypes>
										<subtype value="boardgame" />
										<subtype value="boardgameimplementation" />
									</subtypes>
			</item>
									<players>
									<player username="" userid="0" name="Christian" startposition="" color="" score="" new="1" rating="0" win="0" />
						<player username="fokuleh" userid="1518480" name="Fokuleh" startposition="" color="" score="" new="0" rating="0" win="0" />
						<player username="Hellogark" userid="1667501" name="Hellogark" startposition="" color="" score="" new="1" rating="0" win="0" />
						<player username="" userid="0" name="Nechiwero" startposition="" color="" score="" new="0" rating="0" win="1" />
						<player username="Vazquez" userid="2121508" name="Ulises Vazquez" startposition="" color="" score="" new="0" rating="0" win="0" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="" new="0" rating="0" win="0" />
						</players>
					</play>
	<play id="60834507" date="2022-05-19" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Gingerbread House" objecttype="thing" objectid="258444">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="SkyHunter1092" userid="1530044" name="Marcos" startposition="" color="" score="" new="1" rating="0" win="0" />
						<player username="" userid="0" name="Nechiwero" startposition="" color="" score="" new="1" rating="0" win="1" />
						<player username="Shammuk" userid="592933" name="Shammuk Christian" startposition="" color="" score="" new="1" rating="0" win="0" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="" new="0" rating="0" win="0" />
						</players>
					</play>
	<play id="60822492" date="2022-05-19" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="L.L.A.M.A." objecttype="thing" objectid="266083">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="SkyHunter1092" userid="1530044" name="Marcos" startposition="" color="" score="-41" new="0" rating="0" win="0" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="-4" new="0" rating="0" win="1" />
						</players>
					</play>
	<play id="60832037" date="2022-05-19" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Terraforming Mars" objecttype="thing" objectid="167791">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="" userid="0" name="Bany" startposition="" color="" score="41" new="1" rating="0" win="0" />
						<player username="SkyHunter1092" userid="1530044" name="Marcos" startposition="" color="" score="47" new="0" rating="0" win="0" />
						<player username="" userid="0" name="Nechiwero" startposition="" color="" score="53" new="1" rating="0" win="0" />
						<player username="Shammuk" userid="592933" name="Shammuk Christian" startposition="" color="" score="58" new="0" rating="0" win="0" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="76" new="0" rating="0" win="1" />
						</players>
					</play>
	<play id="60769574" date="2022-05-16" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Gingerbread House" objecttype="thing" objectid="258444">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="" userid="0" name="Marcelita" startposition="" color="" score="54" new="1" rating="0" win="1" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="40" new="1" rating="0" win="0" />
						</players>
					</play>
	<play id="60770108" date="2022-05-16" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Gingerbread House" objecttype="thing" objectid="258444">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="" userid="0" name="Marcelita" startposition="" color="" score="64" new="0" rating="0" win="1" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="56" new="0" rating="0" win="0" />
						</players>
					</play>
	<play id="60711961" date="2022-05-14" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="CuBirds" objecttype="thing" objectid="245476">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="" userid="0" name="Maribel" startposition="" color="" score="" new="1" rating="0" win="0" />
						<player username="" userid="0" name="Mora" startposition="" color="" score="" new="1" rating="0" win="0" />
						<player username="" userid="0" name="Taka" startposition="" color="" score="" new="1" rating="0" win="1" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="" new="0" rating="0" win="0" />
						</players>
					</play>
	<play id="60711963" date="2022-05-14" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="CuBirds" objecttype="thing" objectid="245476">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="" userid="0" name="Maribel" startposition="" color="" score="" new="0" rating="0" win="0" />
						<player username="" userid="0" name="Mora" startposition="" color="" score="" new="0" rating="0" win="1" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="" new="0" rating="0" win="0" />
						</players>
					</play>
	<play id="60657517" date="2022-05-12" quantity="1" length="0" incomplete="0" nowinstats="0" location="">
			<item name="Space Hulk: Death Angel – The Card Game" objecttype="thing" objectid="71721">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="SkyHunter1092" userid="1530044" name="Marcos" startposition="" color="" score="" new="1" rating="0" win="1" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="" new="1" rating="0" win="1" />
						</players>
					</play>
	<play id="60658649" date="2022-05-12" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Ticket to Ride Map Collection: Volume 4 – Nederland" objecttype="thing" objectid="147938">
				<subtypes>
										<subtype value="boardgame" />
										<subtype value="boardgameexpansion" />
										<subtype value="boardgameintegration" />
									</subtypes>
			</item>
									<players>
									<player username="SkyHunter1092" userid="1530044" name="Marcos" startposition="" color="" score="215" new="0" rating="0" win="0" />
						<player username="" userid="0" name="Melki" startposition="" color="" score="209" new="1" rating="0" win="0" />
						<player username="" userid="0" name="Ulises" startposition="" color="" score="250" new="0" rating="0" win="1" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="176" new="0" rating="0" win="0" />
						</players>
					</play>
	<play id="60617689" date="2022-05-10" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="CuBirds" objecttype="thing" objectid="245476">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="Azgarm" userid="1664533" name="Miguel Angel" startposition="" color="" score="" new="1" rating="0" win="0" />
						<player username="" userid="0" name="Pedro Miguel" startposition="" color="" score="" new="1" rating="0" win="0" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="" new="0" rating="0" win="1" />
						</players>
					</play>
	<play id="60617690" date="2022-05-10" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="CuBirds" objecttype="thing" objectid="245476">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="Azgarm" userid="1664533" name="Miguel Angel" startposition="" color="" score="" new="0" rating="0" win="0" />
						<player username="" userid="0" name="Pedro Miguel" startposition="" color="" score="" new="0" rating="0" win="0" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="" new="0" rating="0" win="1" />
						</players>
					</play>
	<play id="60617691" date="2022-05-10" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="CuBirds" objecttype="thing" objectid="245476">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="Azgarm" userid="1664533" name="Miguel Angel" startposition="" color="" score="" new="0" rating="0" win="0" />
						<player username="" userid="0" name="Pedro Miguel" startposition="" color="" score="" new="0" rating="0" win="0" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="" new="0" rating="0" win="1" />
						</players>
					</play>
	<play id="60617692" date="2022-05-10" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="CuBirds" objecttype="thing" objectid="245476">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="Azgarm" userid="1664533" name="Miguel Angel" startposition="" color="" score="" new="0" rating="0" win="0" />
						<player username="" userid="0" name="Pedro Miguel" startposition="" color="" score="" new="0" rating="0" win="1" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="" new="0" rating="0" win="0" />
						</players>
					</play>
	<play id="60617678" date="2022-05-10" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Sushi Roll" objecttype="thing" objectid="271869">
				<subtypes>
										<subtype value="boardgame" />
										<subtype value="boardgameimplementation" />
									</subtypes>
			</item>
									<players>
									<player username="Azgarm" userid="1664533" name="Miguel Angel" startposition="" color="" score="50" new="1" rating="0" win="0" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="66" new="0" rating="0" win="1" />
						</players>
					</play>
	<play id="60497212" date="2022-05-06" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Beasty Bar" objecttype="thing" objectid="165950">
				<subtypes>
										<subtype value="boardgame" />
										<subtype value="boardgameintegration" />
									</subtypes>
			</item>
									<players>
									<player username="Melki" userid="1103233" name="Melkisedec" startposition="" color="" score="" new="0" rating="0" win="0" />
						<player username="" userid="0" name="Vicente" startposition="" color="" score="" new="0" rating="0" win="0" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="" new="0" rating="0" win="1" />
						</players>
					</play>
	<play id="60497294" date="2022-05-06" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Beasty Bar" objecttype="thing" objectid="165950">
				<subtypes>
										<subtype value="boardgame" />
										<subtype value="boardgameintegration" />
									</subtypes>
			</item>
									<players>
									<player username="Melki" userid="1103233" name="Melkisedec" startposition="" color="" score="" new="0" rating="0" win="1" />
						<player username="" userid="0" name="Vicente" startposition="" color="" score="" new="0" rating="0" win="1" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="" new="0" rating="0" win="0" />
						</players>
					</play>
	<play id="60493345" date="2022-05-05" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="7 Wonders Duel" objecttype="thing" objectid="173346">
				<subtypes>
										<subtype value="boardgame" />
										<subtype value="boardgameimplementation" />
									</subtypes>
			</item>
									<players>
									<player username="" userid="0" name="Nechiwero" startposition="" color="" score="35" new="1" rating="0" win="0" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="60" new="0" rating="0" win="1" />
						</players>
					</play>
	<play id="60493942" date="2022-05-05" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Blueprints" objecttype="thing" objectid="140933">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="" userid="0" name="Nechiwero" startposition="" color="" score="6" new="1" rating="0" win="0" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="8" new="0" rating="0" win="1" />
						</players>
					</play>
	<play id="60497004" date="2022-05-05" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Railways of the World" objecttype="thing" objectid="17133">
				<subtypes>
										<subtype value="boardgame" />
										<subtype value="boardgameimplementation" />
										<subtype value="boardgameintegration" />
									</subtypes>
			</item>
									<players>
									<player username="SkyHunter1092" userid="1530044" name="Marcos" startposition="" color="" score="65" new="1" rating="0" win="0" />
						<player username="Melki" userid="1103233" name="Melkisedec" startposition="" color="" score="63" new="1" rating="0" win="0" />
						<player username="" userid="0" name="Nechiwero" startposition="" color="" score="66" new="1" rating="0" win="0" />
						<player username="" userid="0" name="Vicente" startposition="" color="" score="49" new="1" rating="0" win="0" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="68" new="0" rating="0" win="1" />
						</players>
					</play>
	<play id="60372454" date="2022-04-30" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Azul" objecttype="thing" objectid="230802">
				<subtypes>
										<subtype value="boardgame" />
										<subtype value="boardgameintegration" />
									</subtypes>
			</item>
									<players>
									<player username="" userid="0" name="Maribel" startposition="" color="" score="37" new="0" rating="0" win="1" />
						<player username="" userid="0" name="Mora" startposition="" color="" score="32" new="0" rating="0" win="0" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="22" new="0" rating="0" win="0" />
						</players>
					</play>
	<play id="60373850" date="2022-04-30" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Azul" objecttype="thing" objectid="230802">
				<subtypes>
										<subtype value="boardgame" />
										<subtype value="boardgameintegration" />
									</subtypes>
			</item>
									<players>
									<player username="" userid="0" name="Marcela Yadira" startposition="" color="" score="76" new="0" rating="0" win="0" />
						<player username="" userid="0" name="Maribel" startposition="" color="" score="98" new="0" rating="0" win="0" />
						<player username="" userid="0" name="Mora" startposition="" color="" score="86" new="0" rating="0" win="0" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="120" new="0" rating="0" win="1" />
						</players>
					</play>
	<play id="60374780" date="2022-04-30" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Azul" objecttype="thing" objectid="230802">
				<subtypes>
										<subtype value="boardgame" />
										<subtype value="boardgameintegration" />
									</subtypes>
			</item>
									<players>
									<player username="" userid="0" name="Marcelita" startposition="" color="" score="91" new="0" rating="0" win="1" />
						<player username="" userid="0" name="Maribel" startposition="" color="" score="75" new="0" rating="0" win="0" />
						<player username="" userid="0" name="Mora" startposition="" color="" score="67" new="0" rating="0" win="0" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="61" new="0" rating="0" win="0" />
						</players>
					</play>
	<play id="60375444" date="2022-04-30" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Azul" objecttype="thing" objectid="230802">
				<subtypes>
										<subtype value="boardgame" />
										<subtype value="boardgameintegration" />
									</subtypes>
			</item>
									<players>
									<player username="" userid="0" name="Marcelita" startposition="" color="" score="88" new="0" rating="0" win="1" />
						<player username="" userid="0" name="Maribel" startposition="" color="" score="48" new="0" rating="0" win="0" />
						<player username="" userid="0" name="Mora" startposition="" color="" score="49" new="0" rating="0" win="0" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="54" new="0" rating="0" win="0" />
						</players>
					</play>
	<play id="60376767" date="2022-04-30" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Ticket to Ride Map Collection: Volume 2 – India &amp; Switzerland" objecttype="thing" objectid="106645">
				<subtypes>
										<subtype value="boardgame" />
										<subtype value="boardgameexpansion" />
										<subtype value="boardgamecompilation" />
										<subtype value="boardgameintegration" />
									</subtypes>
			</item>
									<players>
									<player username="" userid="0" name="Maribel" startposition="" color="" score="128" new="1" rating="0" win="1" />
						<player username="" userid="0" name="Mora" startposition="" color="" score="114" new="1" rating="0" win="0" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="124" new="0" rating="0" win="0" />
						</players>
					</play>
	<play id="60157028" date="2022-04-21" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Camel Up (Second Edition)" objecttype="thing" objectid="260605">
				<subtypes>
										<subtype value="boardgame" />
										<subtype value="boardgameimplementation" />
									</subtypes>
			</item>
									<players>
									<player username="fokuleh" userid="1518480" name="Fokuleh" startposition="" color="" score="24" new="0" rating="0" win="1" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="16" new="0" rating="0" win="0" />
						<player username="" userid="0" name="Melki" startposition="" color="" score="18" new="1" rating="0" win="0" />
						<player username="" userid="0" name="Nechiwero" startposition="" color="" score="16" new="1" rating="0" win="0" />
						<player username="" userid="0" name="Shamuko" startposition="" color="" score="16" new="0" rating="0" win="0" />
						<player username="Vazquez" userid="2121508" name="Ulises Vazquez" startposition="" color="" score="12" new="0" rating="0" win="0" />
						</players>
					</play>
	<play id="60157023" date="2022-04-21" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="The Castles of Burgundy" objecttype="thing" objectid="84876">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="fokuleh" userid="1518480" name="Fokuleh" startposition="" color="" score="65" new="0" rating="0" win="0" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="203" new="1" rating="0" win="0" />
						<player username="" userid="0" name="Nechiwero" startposition="" color="" score="89" new="1" rating="0" win="0" />
						<player username="Vazquez" userid="2121508" name="Ulises Vazquez" startposition="" color="" score="209" new="0" rating="0" win="1" />
						</players>
					</play>
	<play id="60140251" date="2022-04-21" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Ohanami" objecttype="thing" objectid="270314">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="161" new="1" rating="0" win="1" />
						<player username="Vazquez" userid="2121508" name="Ulises Vazquez" startposition="" color="" score="155" new="0" rating="0" win="0" />
						</players>
					</play>
	<play id="60157012" date="2022-04-21" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Star Wars: Jabba&#039;s Palace – A Love Letter Game" objecttype="thing" objectid="353470">
				<subtypes>
										<subtype value="boardgame" />
										<subtype value="boardgameimplementation" />
									</subtypes>
			</item>
									<players>
									<player username="fokuleh" userid="1518480" name="Fokuleh" startposition="" color="" score="1" new="1" rating="0" win="0" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="1" new="1" rating="0" win="0" />
						<player username="" userid="0" name="Melki" startposition="" color="" score="2" new="1" rating="0" win="0" />
						<player username="" userid="0" name="Nechiwero" startposition="" color="" score="1" new="1" rating="0" win="0" />
						<player username="" userid="0" name="Shamuko" startposition="" color="" score="3" new="1" rating="0" win="1" />
						<player username="Vazquez" userid="2121508" name="Ulises Vazquez" startposition="" color="" score="1" new="1" rating="0" win="0" />
						</players>
					</play>
	<play id="60157014" date="2022-04-21" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Star Wars: Jabba&#039;s Palace – A Love Letter Game" objecttype="thing" objectid="353470">
				<subtypes>
										<subtype value="boardgame" />
										<subtype value="boardgameimplementation" />
									</subtypes>
			</item>
									<players>
									<player username="fokuleh" userid="1518480" name="Fokuleh" startposition="" color="" score="3" new="0" rating="0" win="1" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="0" new="0" rating="0" win="0" />
						<player username="" userid="0" name="Melki" startposition="" color="" score="1" new="0" rating="0" win="0" />
						<player username="" userid="0" name="Nechiwero" startposition="" color="" score="0" new="0" rating="0" win="0" />
						<player username="" userid="0" name="Shamuko" startposition="" color="" score="0" new="0" rating="0" win="0" />
						<player username="Vazquez" userid="2121508" name="Ulises Vazquez" startposition="" color="" score="0" new="0" rating="0" win="0" />
						</players>
					</play>
	<play id="60157030" date="2022-04-21" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Weapon Wars" objecttype="thing" objectid="257316">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="fokuleh" userid="1518480" name="Fokuleh" startposition="" color="" score="1" new="0" rating="0" win="1" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="0" new="1" rating="0" win="0" />
						<player username="" userid="0" name="Melki" startposition="" color="" score="0" new="1" rating="0" win="0" />
						<player username="" userid="0" name="Nechiwero" startposition="" color="" score="0" new="1" rating="0" win="0" />
						<player username="" userid="0" name="Shamuko" startposition="" color="" score="0" new="0" rating="0" win="0" />
						<player username="Vazquez" userid="2121508" name="Ulises Vazquez" startposition="" color="" score="0" new="0" rating="0" win="0" />
						</players>
					</play>
	<play id="60111507" date="2022-04-20" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="CuBirds" objecttype="thing" objectid="245476">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="" userid="0" name="Panchito" startposition="" color="" score="" new="1" rating="0" win="0" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="" new="0" rating="0" win="1" />
						</players>
					</play>
	<play id="60111497" date="2022-04-20" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Star Wars: Jabba&#039;s Palace – A Love Letter Game" objecttype="thing" objectid="353470">
				<subtypes>
										<subtype value="boardgame" />
										<subtype value="boardgameimplementation" />
									</subtypes>
			</item>
									<players>
									<player username="" userid="0" name="Panchito" startposition="" color="" score="" new="0" rating="0" win="0" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="" new="0" rating="0" win="1" />
						</players>
					</play>
	<play id="60080010" date="2022-04-18" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Star Wars: Jabba&#039;s Palace – A Love Letter Game" objecttype="thing" objectid="353470">
				<subtypes>
										<subtype value="boardgame" />
										<subtype value="boardgameimplementation" />
									</subtypes>
			</item>
									<players>
									<player username="" userid="0" name="Panchito" startposition="" color="" score="" new="0" rating="0" win="1" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="" new="0" rating="0" win="0" />
						</players>
					</play>
	<play id="60080012" date="2022-04-18" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Star Wars: Jabba&#039;s Palace – A Love Letter Game" objecttype="thing" objectid="353470">
				<subtypes>
										<subtype value="boardgame" />
										<subtype value="boardgameimplementation" />
									</subtypes>
			</item>
									<players>
									<player username="" userid="0" name="Panchito" startposition="" color="" score="" new="0" rating="0" win="1" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="" new="0" rating="0" win="0" />
						</players>
					</play>
	<play id="59989064" date="2022-04-16" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Star Wars: Jabba&#039;s Palace – A Love Letter Game" objecttype="thing" objectid="353470">
				<subtypes>
										<subtype value="boardgame" />
										<subtype value="boardgameimplementation" />
									</subtypes>
			</item>
									<players>
									<player username="" userid="0" name="Panchito" startposition="" color="" score="" new="1" rating="0" win="1" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="" new="1" rating="0" win="0" />
						</players>
					</play>
	<play id="59989088" date="2022-04-15" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Cape May" objecttype="thing" objectid="281248">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="" userid="0" name="Fili" startposition="" color="" score="52" new="1" rating="0" win="0" />
						<player username="" userid="0" name="Mora" startposition="" color="" score="74" new="1" rating="0" win="0" />
						<player username="" userid="0" name="Takashi" startposition="" color="" score="82" new="1" rating="0" win="1" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="74" new="0" rating="0" win="0" />
						</players>
					</play>
	<play id="59914053" date="2022-04-13" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Ticket to Ride Map Collection: Volume 7 – Japan &amp; Italy" objecttype="thing" objectid="288679">
				<subtypes>
										<subtype value="boardgame" />
										<subtype value="boardgameexpansion" />
									</subtypes>
			</item>
									<players>
									<player username="" userid="0" name="Cieloderit" startposition="" color="" score="0" new="0" rating="0" win="0" />
						<player username="" userid="0" name="Maribel" startposition="" color="" score="67" new="0" rating="0" win="1" />
						<player username="" userid="0" name="Mora" startposition="" color="" score="62" new="0" rating="0" win="0" />
						<player username="" userid="0" name="Takashi" startposition="" color="" score="21" new="0" rating="0" win="0" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="54" new="0" rating="0" win="0" />
						</players>
					</play>
	<play id="59893687" date="2022-04-12" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Terra Mystica" objecttype="thing" objectid="120677">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="" userid="0" name="Christian" startposition="" color="" score="88" new="1" rating="0" win="0" />
						<player username="" userid="0" name="Nechiwero" startposition="" color="" score="94" new="1" rating="0" win="1" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="87" new="1" rating="0" win="0" />
						</players>
					</play>
	<play id="59912961" date="2022-04-12" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Terra Mystica" objecttype="thing" objectid="120677">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="" new="1" rating="0" win="0" />
						</players>
					</play>
	<play id="59776423" date="2022-04-09" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Century: Spice Road" objecttype="thing" objectid="209685">
				<subtypes>
										<subtype value="boardgame" />
										<subtype value="boardgameintegration" />
									</subtypes>
			</item>
									<players>
									<player username="" userid="0" name="Cieloderit" startposition="" color="" score="67" new="0" rating="0" win="1" />
						<player username="" userid="0" name="Maribel" startposition="" color="" score="44" new="0" rating="0" win="0" />
						<player username="" userid="0" name="Mora" startposition="" color="" score="60" new="0" rating="0" win="0" />
						<player username="" userid="0" name="Takashi" startposition="" color="" score="38" new="0" rating="0" win="0" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="55" new="0" rating="0" win="0" />
						</players>
					</play>
	<play id="59754299" date="2022-04-07" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="King of Tokyo: Dark Edition" objecttype="thing" objectid="293141">
				<subtypes>
										<subtype value="boardgame" />
										<subtype value="boardgameimplementation" />
									</subtypes>
			</item>
									<players>
									<player username="Hellogark" userid="1667501" name="Hellogark" startposition="" color="" score="4" new="0" rating="0" win="0" />
						<player username="" userid="0" name="Juan Carlos Rouge" startposition="" color="" score="5" new="0" rating="0" win="1" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="3" new="0" rating="0" win="0" />
						<player username="" userid="0" name="Nechiwero" startposition="" color="" score="1" new="0" rating="0" win="0" />
						<player username="" userid="0" name="Ulises" startposition="" color="" score="2" new="0" rating="0" win="0" />
						</players>
					</play>
	<play id="59761670" date="2022-04-07" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Terraforming Mars" objecttype="thing" objectid="167791">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="62" new="0" rating="0" win="0" />
						<player username="" userid="0" name="Nechiwero" startposition="" color="" score="34" new="1" rating="0" win="0" />
						<player username="" userid="0" name="Shamuko" startposition="" color="" score="63" new="0" rating="0" win="1" />
						<player username="Vazquez" userid="2121508" name="Ulises Vazquez" startposition="" color="" score="45" new="0" rating="0" win="0" />
						</players>
					</play>
	<play id="59754300" date="2022-04-07" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Vampire Queen" objecttype="thing" objectid="191073">
				<subtypes>
										<subtype value="boardgame" />
										<subtype value="boardgameimplementation" />
									</subtypes>
			</item>
									<players>
									<player username="" userid="0" name="Christian" startposition="" color="" score="284" new="0" rating="0" win="0" />
						<player username="Hellogark" userid="1667501" name="Hellogark" startposition="" color="" score="132" new="0" rating="0" win="0" />
						<player username="" userid="0" name="Juan Carlos Rouge" startposition="" color="" score="219" new="0" rating="0" win="0" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="88" new="0" rating="0" win="1" />
						<player username="" userid="0" name="Melki" startposition="" color="" score="203" new="0" rating="0" win="0" />
						<player username="" userid="0" name="Nechiwero" startposition="" color="" score="134" new="0" rating="0" win="0" />
						<player username="" userid="0" name="Ulises" startposition="" color="" score="211" new="0" rating="0" win="0" />
						</players>
					</play>
	<play id="59616259" date="2022-04-02" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Bandido" objecttype="thing" objectid="191925">
				<subtypes>
										<subtype value="boardgame" />
										<subtype value="boardgameintegration" />
									</subtypes>
			</item>
									<players>
									<player username="" userid="0" name="Jugador anónimo" startposition="" color="" score="" new="0" rating="0" win="0" />
						<player username="" userid="0" name="Marcelita" startposition="" color="" score="" new="0" rating="0" win="0" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="" new="0" rating="0" win="0" />
						</players>
					</play>
	<play id="59616260" date="2022-04-02" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Bandido" objecttype="thing" objectid="191925">
				<subtypes>
										<subtype value="boardgame" />
										<subtype value="boardgameintegration" />
									</subtypes>
			</item>
									<players>
									<player username="" userid="0" name="Jugador anónimo" startposition="" color="" score="" new="0" rating="0" win="0" />
						<player username="" userid="0" name="Marcelita" startposition="" color="" score="" new="0" rating="0" win="0" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="" new="0" rating="0" win="0" />
						</players>
					</play>
	<play id="59616272" date="2022-04-02" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Bandido" objecttype="thing" objectid="191925">
				<subtypes>
										<subtype value="boardgame" />
										<subtype value="boardgameintegration" />
									</subtypes>
			</item>
									<players>
									<player username="" userid="0" name="Jugador anónimo" startposition="" color="" score="" new="0" rating="0" win="1" />
						<player username="" userid="0" name="Marcelita" startposition="" color="" score="" new="0" rating="0" win="1" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="" new="0" rating="0" win="1" />
						</players>
					</play>
	<play id="59613387" date="2022-04-02" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Beasty Bar" objecttype="thing" objectid="165950">
				<subtypes>
										<subtype value="boardgame" />
										<subtype value="boardgameintegration" />
									</subtypes>
			</item>
									<players>
									<player username="" userid="0" name="Jugador anónimo" startposition="" color="" score="" new="0" rating="0" win="0" />
						<player username="" userid="0" name="Marcelita" startposition="" color="" score="" new="0" rating="0" win="1" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="" new="0" rating="0" win="0" />
						</players>
					</play>
	<play id="59613580" date="2022-04-02" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Beasty Bar" objecttype="thing" objectid="165950">
				<subtypes>
										<subtype value="boardgame" />
										<subtype value="boardgameintegration" />
									</subtypes>
			</item>
									<players>
									<player username="" userid="0" name="Jugador anónimo" startposition="" color="" score="" new="0" rating="0" win="1" />
						<player username="" userid="0" name="Marcelita" startposition="" color="" score="" new="0" rating="0" win="0" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="" new="0" rating="0" win="0" />
						</players>
					</play>
	<play id="59612277" date="2022-04-02" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Carcassonne: Amazonas" objecttype="thing" objectid="206940">
				<subtypes>
										<subtype value="boardgame" />
										<subtype value="boardgameimplementation" />
									</subtypes>
			</item>
									<players>
									<player username="" userid="0" name="Jugador anónimo" startposition="" color="" score="98" new="0" rating="0" win="0" />
						<player username="" userid="0" name="Marcelita" startposition="" color="" score="111" new="0" rating="0" win="1" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="110" new="0" rating="0" win="0" />
						</players>
					</play>
	<play id="59610386" date="2022-04-02" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Spring Meadow" objecttype="thing" objectid="253684">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="" userid="0" name="Jugador anónimo" startposition="" color="" score="75" new="0" rating="0" win="0" />
						<player username="" userid="0" name="Marcelita" startposition="" color="" score="79" new="0" rating="0" win="0" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="87" new="0" rating="0" win="1" />
						</players>
					</play>
	<play id="59566896" date="2022-03-31" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Cacao" objecttype="thing" objectid="171499">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="56" new="1" rating="0" win="0" />
						<player username="" userid="0" name="Nechiwero" startposition="" color="" score="54" new="1" rating="0" win="0" />
						<player username="Vazquez" userid="2121508" name="Ulises Vazquez" startposition="" color="" score="60" new="1" rating="0" win="1" />
						</players>
					</play>
	<play id="59573380" date="2022-03-31" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Cape May" objecttype="thing" objectid="281248">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="74" new="0" rating="0" win="1" />
						<player username="" userid="0" name="Melki" startposition="" color="" score="40" new="1" rating="0" win="0" />
						<player username="Vazquez" userid="2121508" name="Ulises Vazquez" startposition="" color="" score="70" new="0" rating="0" win="0" />
						</players>
					</play>
	<play id="59566894" date="2022-03-31" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Kingdomino: Age of Giants" objecttype="thing" objectid="240909">
				<subtypes>
										<subtype value="boardgame" />
										<subtype value="boardgameexpansion" />
									</subtypes>
			</item>
									<players>
									<player username="fokuleh" userid="1518480" name="Fokuleh" startposition="" color="" score="35" new="0" rating="0" win="0" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="104" new="0" rating="0" win="1" />
						<player username="" userid="0" name="Nechiwero" startposition="" color="" score="52" new="1" rating="0" win="0" />
						<player username="" userid="0" name="Shamuko" startposition="" color="" score="33" new="0" rating="0" win="0" />
						<player username="Vazquez" userid="2121508" name="Ulises Vazquez" startposition="" color="" score="78" new="0" rating="0" win="0" />
						</players>
					</play>
	<play id="59566893" date="2022-03-31" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="No Thanks!" objecttype="thing" objectid="12942">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="fokuleh" userid="1518480" name="Fokuleh" startposition="" color="" score="-50" new="0" rating="0" win="0" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="-25" new="0" rating="0" win="0" />
						<player username="" userid="0" name="Nechiwero" startposition="" color="" score="-54" new="1" rating="0" win="0" />
						<player username="" userid="0" name="Shamuko" startposition="" color="" score="-99" new="0" rating="0" win="0" />
						<player username="Vazquez" userid="2121508" name="Ulises Vazquez" startposition="" color="" score="-11" new="0" rating="0" win="1" />
						</players>
					</play>
	<play id="59563867" date="2022-03-31" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Orchard: A 9 card solitaire game" objecttype="thing" objectid="245487">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="21" new="0" rating="0" win="1" />
						</players>
					</play>
	<play id="59563960" date="2022-03-31" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Orchard: A 9 card solitaire game" objecttype="thing" objectid="245487">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="30" new="0" rating="0" win="1" />
						</players>
					</play>
	<play id="59483152" date="2022-03-27" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Orchard: A 9 card solitaire game" objecttype="thing" objectid="245487">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="33" new="0" rating="0" win="1" />
						</players>
					</play>
	<play id="59483483" date="2022-03-27" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Orchard: A 9 card solitaire game" objecttype="thing" objectid="245487">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="29" new="0" rating="0" win="1" />
						</players>
					</play>
	<play id="59483844" date="2022-03-27" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Orchard: A 9 card solitaire game" objecttype="thing" objectid="245487">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="14" new="0" rating="0" win="1" />
						</players>
					</play>
	<play id="59484073" date="2022-03-27" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Orchard: A 9 card solitaire game" objecttype="thing" objectid="245487">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="51" new="0" rating="0" win="1" />
						</players>
					</play>
	<play id="59394388" date="2022-03-24" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Diamonds: Second Edition" objecttype="thing" objectid="152162">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="" userid="0" name="Christian" startposition="" color="" score="42" new="0" rating="0" win="0" />
						<player username="" userid="0" name="Juan Carlos Rouge" startposition="" color="" score="48" new="0" rating="0" win="0" />
						<player username="" userid="0" name="Martin Lost Cities" startposition="" color="" score="34" new="1" rating="0" win="0" />
						<player username="" userid="0" name="Nechiwero" startposition="" color="" score="49" new="1" rating="0" win="0" />
						<player username="" userid="0" name="Vicente" startposition="" color="" score="34" new="0" rating="0" win="0" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="54" new="0" rating="0" win="1" />
						</players>
					</play>
	<play id="59393456" date="2022-03-24" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Imhotep" objecttype="thing" objectid="191862">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="" userid="0" name="Christian" startposition="" color="" score="37" new="1" rating="0" win="0" />
						<player username="" userid="0" name="Martin Lost Cities" startposition="" color="" score="33" new="1" rating="0" win="0" />
						<player username="" userid="0" name="Nechiwero" startposition="" color="" score="41" new="1" rating="0" win="1" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="41" new="0" rating="0" win="0" />
						</players>
					</play>
	<play id="59391567" date="2022-03-24" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Lost Cities" objecttype="thing" objectid="50">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="" userid="0" name="Martin" startposition="" color="" score="14" new="0" rating="0" win="0" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="40" new="0" rating="0" win="1" />
						</players>
					</play>
	<play id="59392711" date="2022-03-24" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Tiny Epic Galaxies" objecttype="thing" objectid="163967">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="" userid="0" name="Martin Lost Cities" startposition="" color="" score="15" new="1" rating="0" win="0" />
						<player username="" userid="0" name="Nechiwero" startposition="" color="" score="25" new="1" rating="0" win="1" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="18" new="0" rating="0" win="0" />
						</players>
					</play>
	<play id="59238061" date="2022-03-19" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Century: Spice Road" objecttype="thing" objectid="209685">
				<subtypes>
										<subtype value="boardgame" />
										<subtype value="boardgameintegration" />
									</subtypes>
			</item>
									<players>
									<player username="" userid="0" name="Cieloderit" startposition="" color="" score="55" new="0" rating="0" win="0" />
						<player username="" userid="0" name="Maribel" startposition="" color="" score="56" new="0" rating="0" win="0" />
						<player username="" userid="0" name="Mora" startposition="" color="" score="60" new="0" rating="0" win="0" />
						<player username="" userid="0" name="Takashi" startposition="" color="" score="57" new="0" rating="0" win="0" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="69" new="0" rating="0" win="1" />
						</players>
					</play>
	<play id="59238557" date="2022-03-19" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Century: Spice Road" objecttype="thing" objectid="209685">
				<subtypes>
										<subtype value="boardgame" />
										<subtype value="boardgameintegration" />
									</subtypes>
			</item>
									<players>
									<player username="" userid="0" name="Cieloderit" startposition="" color="" score="38" new="0" rating="0" win="0" />
						<player username="" userid="0" name="Maribel" startposition="" color="" score="27" new="0" rating="0" win="0" />
						<player username="" userid="0" name="Mora" startposition="" color="" score="40" new="0" rating="0" win="0" />
						<player username="" userid="0" name="Takashi" startposition="" color="" score="33" new="0" rating="0" win="0" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="44" new="0" rating="0" win="1" />
						</players>
					</play>
	<play id="59239067" date="2022-03-19" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Century: Spice Road" objecttype="thing" objectid="209685">
				<subtypes>
										<subtype value="boardgame" />
										<subtype value="boardgameintegration" />
									</subtypes>
			</item>
									<players>
									<player username="" userid="0" name="Cieloderit" startposition="" color="" score="66" new="0" rating="0" win="1" />
						<player username="" userid="0" name="Maribel" startposition="" color="" score="45" new="0" rating="0" win="0" />
						<player username="" userid="0" name="Mora" startposition="" color="" score="43" new="0" rating="0" win="0" />
						<player username="" userid="0" name="Takashi" startposition="" color="" score="56" new="0" rating="0" win="0" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="42" new="0" rating="0" win="0" />
						</players>
					</play>
	<play id="59249464" date="2022-03-19" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Love Letter" objecttype="thing" objectid="129622">
				<subtypes>
										<subtype value="boardgame" />
									</subtypes>
			</item>
									<players>
									<player username="" userid="0" name="Panchito" startposition="" color="" score="" new="0" rating="0" win="1" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="" new="0" rating="0" win="0" />
						</players>
					</play>
	<play id="59238644" date="2022-03-19" quantity="1" length="0" incomplete="0" nowinstats="0" location="Casa">
			<item name="Railroad Ink: Blazing Red Edition" objecttype="thing" objectid="251678">
				<subtypes>
										<subtype value="boardgame" />
										<subtype value="boardgameintegration" />
									</subtypes>
			</item>
									<players>
									<player username="" userid="0" name="Cieloderit" startposition="" color="" score="" new="1" rating="0" win="1" />
						<player username="" userid="0" name="Maribel" startposition="" color="" score="" new="1" rating="0" win="0" />
						<player username="" userid="0" name="Mora" startposition="" color="" score="" new="1" rating="0" win="0" />
						<player username="" userid="0" name="Takashi" startposition="" color="" score="" new="1" rating="0" win="0" />
						<player username="juandalf" userid="482490" name="juandalf Algara" startposition="" color="" score="" new="0" rating="0" win="0" />
						</players>
					</play>
	</plays>
""";
