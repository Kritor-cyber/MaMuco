 abstract class Internationalization {


	String getAppName();
	String getToday();
	String getTomorrow();
	String getDay(int number);
	String getMonth(int number);
	String getMonthly();

	// Fast adding buttons
	String getAddSymptoms();
	String getAddEvents();
	String getAddDrugs();

	// Fast access buttons
	String getCalendarButtonName();
	String getSymptomButtonName();
	String getDrugsButtonName();
	String getCalendarButtonToolTip();
	String getSymptomButtonToolTip();
	String getDrugsButtonToolTip();

	String getSymptomCalendar ();
	String getDrugsCalendar();
	String getMeetingCalendar();

	//Add Events
	String getNameEvent();
	String getDate();
	String getDateEnd();
	String getOccurrence();
	String getDetails();
	String getValidate();
	String getPleaseEnterSomeText();
	String getDateFormat();
	String getOccurrenceFormat();
	String getAskStartingTime();
	String getAskEndingTime();
	String getAt();
	String getTo();

	//Add Drugs
	String getNameDrug();


	String getNoIncomingEvent();
}

class LanguageFr extends Internationalization {

	@override
	String getAppName() { return "MA MUCO"; }
	@override
	String getToday() { return "Aujourd'hui"; }
	@override
	String getTomorrow() { return "Demain"; }
	@override
	String getDay(int number) {
		if (number == 1)
			return "Lundi";
		if (number == 2)
			return "Mardi";
		if (number == 3)
			return "Mercredi";
		if (number == 4)
			return "Jeudi";
		if (number == 5)
			return "Vendredi";
		if (number == 6)
			return "Samedi";
		if (number == 7)
			return "Dimanche";
		else
			return "Numéro de jour invalide : " + number.toString();
	}
	@override
	String getMonth(int number) {
		if (number == 1)
			return "Janvier";
		if (number == 2)
			return "Février";
		if (number == 3)
			return "Mars";
		if (number == 4)
			return "Avril";
		if (number == 5)
			return "Mai";
		if (number == 6)
			return "Juin";
		if (number == 7)
			return "Juillet";
		if (number == 8)
			return "Août";
		if (number == 9)
			return "Septembre";
		if (number == 10)
			return "Octobre";
		if (number == 11)
			return "Novembre";
		if (number == 12)
			return "Décembre";
		else
			return "Numéro de mois invalide : " + number.toString();
	}
	String getMonthly() { return "MENSUEL"; }

	// Fast adding buttons
	@override
	String getAddSymptoms () { return 'Ajouter Symptomes'; }
	@override
	String getAddEvents () { return 'Ajouter Evenement'; }
	@override
	String getAddDrugs () { return 'Ajouter Médicaments'; }


	// Fast access buttons
	@override
	String getCalendarButtonName() { return "CALENDRIER"; }
	@override
	String getSymptomButtonName() { return "SYMPTÔMES"; }
	@override
	String getDrugsButtonName() { return "MÉDICAMENTS"; }
	@override
	String getCalendarButtonToolTip() { return "Accès rapide au calendrier des rendez-vous"; }
	@override
	String getSymptomButtonToolTip() { return "Accès rapide au calendrier des symptômes"; }
	@override
	String getDrugsButtonToolTip() { return "Accès rapide au calendrier des médicaments"; }

	@override
	String getSymptomCalendar () {return "Calendrier des Symptomes";}
	@override
	String getDrugsCalendar() {return "Calendrier des médicaments";}
	@override
	String getMeetingCalendar() { return "Calendrier des rendez-vous";}

	//Add Events
	@override
	String getNameEvent() {return "Evenement";}
	@override
	String getDate(){ return 'Date';}
	@override
	String getDateEnd() { return 'Date de Fin'; }
	@override
	String getOccurrence() { return 'Récurrence'; }
	@override
	String getDetails() {return 'Détails'; }
	@override
	String getValidate() {return 'Validation';}
	@override
	String getPleaseEnterSomeText() { return 'Veuillez entrer du texte...'; }
	@override
	String getDateFormat() { return 'Format de la date : AAAA:MM:JJ:HH:MM'; }
	@override
	String getOccurrenceFormat() { return 'Tous les : AAAA:MM:JJ T (T fois)'; }
	@override
	String getAskStartingTime() { return "Sélectionner l'heure de début : "; }
	@override
	String getAskEndingTime() { return "Sélectionner l'heure de fin : "; }
	@override
	String getAt() { return "à"; }
	@override
	String getTo() { return "au"; }

	//Add Drugs
	String getNameDrug() {return "Médicament"; }

	@override
	String getNoIncomingEvent() { return "Pas d'événement à venir prochainement"; }
}

class LanguageEn extends Internationalization {

	@override
	String getAppName() { return "MY MUCO"; }
	@override
	String getToday() { return "Today"; }
	@override
	String getTomorrow() { return "Tomorrow"; }
	@override
	String getDay(int number) {
		if (number == 1)
			return "Monday";
		if (number == 2)
			return "Tuesday";
		if (number == 3)
			return "Wednesday";
		if (number == 4)
			return "Thursday";
		if (number == 5)
			return "Friday";
		if (number == 6)
			return "Saturday";
		if (number == 7)
			return "Sunday";
		else
			return "Invalid number day: " + number.toString();
	}
	@override
	String getMonth(int number) {
		if (number == 1)
			return "January";
		if (number == 2)
			return "February";
		if (number == 3)
			return "Mars";
		if (number == 4)
			return "April";
		if (number == 5)
			return "May";
		if (number == 6)
			return "June";
		if (number == 7)
			return "July";
		if (number == 8)
			return "August";
		if (number == 9)
			return "September";
		if (number == 10)
			return "October";
		if (number == 11)
			return "November";
		if (number == 12)
			return "December";
		else
			return "Invalid month number: " + number.toString();
	}
	@override
	String getMonthly() { return "MONTHLY"; }

	// Fast adding buttons
	@override
	String getAddSymptoms () { return 'Add Symptoms'; }
	@override
	String getAddEvents () { return 'Add Events'; }
	@override
	String getAddDrugs () { return 'Add Drugs'; }

	// Fast access buttons
	@override
	String getCalendarButtonName() { return "CALENDAR"; }
	@override
	String getSymptomButtonName() { return "SYMPTOMS"; }
	@override
	String getDrugsButtonName() { return "DRUGS"; }
	@override
	String getCalendarButtonToolTip() { return "Fast access to appointments' calendar"; }
	@override
	String getSymptomButtonToolTip() { return "Fast access to symptoms' calendar"; }
	@override
	String getDrugsButtonToolTip() { return "Fast access to drugs' calendar"; }

	@override
	String getSymptomCalendar () {return "Symptoms calendar";}
	@override
	String getDrugsCalendar() {return "Drugs calendar";}
	@override
	String getMeetingCalendar() { return "Meeting calendar";}

	//Add Events
	@override
	String getNameEvent() {return "Event";}
	@override
	String getDate(){ return 'Date';}
	@override
	String getDateEnd() { return 'End Date'; }
	@override
	String getOccurrence() { return 'Occurrence'; }
	@override
	String getDetails() {return 'Details'; }
	@override
	String getValidate() {return 'Validation';}
	@override
	String getPleaseEnterSomeText() { return 'Please enter some text...'; }
	@override
	String getDateFormat() { return 'Date format: YYYY:MM:DD:HH:MM'; }
	@override
	String getOccurrenceFormat() { return 'Each: YYYY:MM:DD T (T times)'; }
	@override
	String getAskStartingTime() { return "Select start time: "; }
	@override
	String getAskEndingTime() { return "Select end time: "; }
	@override
	String getAt() { return "at"; }
	@override
	String getTo() { return "to"; }

	//Add Drugs
	String getNameDrug() {return "Drug"; }

	@override
	String getNoIncomingEvent() { return "No incoming event"; }
}