/**
 * @Created_By : AALAA
 * @Date       : 2018.01.21 02:01:18 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.com

enum Profession {
    ACCOUNTANT            ("Accountant"),
    ACTOR                 ("Actor"),
    ACTRESS               ("Actress"),
    ARCHITECT             ("Architect"),
    ARTIST                ("Artist"),
    ATTORNEY              ("Attorney"),
    BANKER                ("Banker"),
    BARBER                ("Barber"),
    BARTENDER             ("Bartender"),
    BOOK_KEEPER           ("Bookkeeper"),
    BUILDER               ("Builder"),
    BUSINESS_MAN          ("Businessman"),
    BUTCHER               ("Butcher"),
    CARPENTER             ("Carpenter"),
    CASHIER               ("Cashier"),
    CHEF                  ("Chef"),
    COACH                 ("Coach"),
    DENTIST               ("Dentist"),
    DESIGNER              ("Designer"),
    DEVELOPER             ("Developer"),
    DIETICIAN             ("Dietician"),
    DOCTOR                ("Doctor"),
    ECONOMIST             ("Economist"),
    EDITOR                ("Editor"),
    ELECTRICIAN           ("Electrician"),
    ENGINEER              ("Engineer"),
    FARMER                ("Farmer"),
    FILM_MAKER            ("Filmmaker"),
    FISHER_MAN            ("Fisherman"),
    FLIGHT_ATTENDANT      ("Flight attendant"),
    JEWELER               ("Jeweler"),
    JUDGE                 ("Judge"),
    LAWYER                ("Lawyer"),
    MECHANIC              ("Mechanic"),
    MUSICIAN              ("Musician"),
    NURSE                 ("Nurse"),
    NUTRITIONIST          ("Nutritionist"),
    OPTICIAN              ("Optician"),
    PAINTER               ("Painter"),
    PHARMACIST            ("Pharmacist"),
    PHOTOGRAPHER          ("Photographer"),
    PHYSICIAN             ("Physician"),
    PHYSICIANS_ASSISTANT  ("Physician's assistant"),
    PILOT                 ("Pilot"),
    PLUMBER               ("Plumber"),
    POLICE_OFFICER        ("Police officer"),
    POLITICIAN            ("Politician"),
    PROFESSOR             ("Professor"),
    PROGRAMMER            ("Programmer"),
    PSYCHOLOGIST          ("Psychologist"),
    RECEPTIONIST          ("Receptionist"),
    SALESMAN              ("Salesman"),
    SALESPERSON           ("Salesperson"),
    SECRETARY             ("Secretary"),
    SINGER                ("Singer"),
    SURGEON               ("Surgeon"),
    TEACHER               ("Teacher"),
    THERAPIST             ("Therapist"),
    TRANSLATOR            ("Translator"),
    UNDERTAKER            ("Undertaker"),
    VETERINARIAN          ("Veterinarian"),
    VIDEO_GRAPHER         ("Videographer"),
    WAITER                ("Waiter"),
    WRITER                ("Writer")

    final String value

    Profession(String value) {
        this.value = value
    }

    String getKey() { name() }

    String toString() { value }
}

