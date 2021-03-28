abstract class Internationalization {

	String getAppName();
}

class LanguageFr extends Internationalization {

	@override
	String getAppName() { return "MA MUCO"; }
}

class LanguageEn extends Internationalization {

	@override
	String getAppName() { return "MY MUCO"; }
}