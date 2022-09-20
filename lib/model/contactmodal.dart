class Contact {
  String id;
  String displayName;

  Name name;
  List<Phone> phones;
  List<Email> emails;
  List<Address> addresses;
  List<Organization> organizations;
  List<Website> websites;
  List<SocialMedia> socialMedias;
  List<Event> events;
  List<Note> notes;
  List<Group> groups;
}
class Name { String first; String last; }
class Phone { String number; String label; }
class Email { String address; String label; }
class Address { String address; String label; }
class Organization { String company; String title; }
class Website { String url; String label; }
class SocialMedia { String userName; String label; }
class Event { int year; int month; int day; String label; }
class Note { String note; }
class Group { String id; String name; }