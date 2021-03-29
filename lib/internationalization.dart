abstract class Internationalization {


	String getAppName();
	String getToday();
	String getTomorrow();
	String getDay(int number);
	String getMonth(int number);

	String getAddSymptoms();
	String getAddEvents();
}

class LanguageFr extends Internationalization {

	@override
	String getAppName() { return "MA MUCO"; }

	String getToday() { return "Aujourd'hui"; }

	String getTomorrow() { return "Demain"; }

	String getAddSymptoms () { return 'Ajouter Symptomes'; }

	String getAddEvents () { return 'Ajouter Evenement'; }

	@override
	String getDay(int number) {
		if (number == 0)
			return "Lundi";
		if (number == 1)
			return "Mardi";
		if (number == 2)
			return "Mercredi";
		if (number == 3)
			return "Jeudi";
		if (number == 4)
			return "Vendredi";
		if (number == 5)
			return "Samedi";
		if (number == 6)
			return "Dimanche";
		else
			return "Numéro de jour invalide : " + number.toString();
	}

	@override
	String getMonth(int number) {
		if (number == 0)
			return "Janvier";
		if (number == 1)
			return "Février";
		if (number == 2)
			return "Mars";
		if (number == 3)
			return "Avril";
		if (number == 4)
			return "Mai";
		if (number == 5)
			return "Juin";
		if (number == 6)
			return "Juillet";
		if (number == 7)
			return "Août";
		if (number == 8)
			return "Septembre";
		if (number == 9)
			return "Octobre";
		if (number == 10)
			return "Novembre";
		if (number == 11)
			return "Décembre";
		else
			return "Numéro de mois invalide : " + number.toString();
	}
}

class LanguageEn extends Internationalization {

	@override
	String getAppName() { return "MY MUCO"; }

	String getToday() { return "Today"; }

	String getTomorrow() { return "Tomorrow"; }

	String getAddSymptoms () { return 'Add Symptoms'; }

	String getAddEvents () { return 'Add Events'; }

	@override
	String getDay(int number) {
		if (number == 0)
			return "Monday";
		if (number == 1)
			return "Tuesday";
		if (number == 2)
			return "Wednesday";
		if (number == 3)
			return "Thursday";
		if (number == 4)
			return "Friday";
		if (number == 5)
			return "Saturday";
		if (number == 6)
			return "Sunday";
		else
			return "Invalid number day: " + number.toString();
	}

	@override
	String getMonth(int number) {
		if (number == 0)
			return "January";
		if (number == 1)
			return "February";
		if (number == 2)
			return "Mars";
		if (number == 3)
			return "April";
		if (number == 4)
			return "May";
		if (number == 5)
			return "June";
		if (number == 6)
			return "July";
		if (number == 7)
			return "August";
		if (number == 8)
			return "September";
		if (number == 9)
			return "October";
		if (number == 10)
			return "November";
		if (number == 11)
			return "December";
		else
			return "Invalid month number: " + number.toString();
	}
}