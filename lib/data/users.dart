class Users {
  String username;
  String password;
  String nim;
  String name;
  String born;
  String classes;
  String hope;
  String image;

  Users({
    required this.username,
    required this.password,
    required this.nim,
    required this.name,
    required this.born,
    required this.classes,
    required this.hope,
    required this.image,
  });
}

var usersList = [
  Users(
      username: 'maldimz',
      password: 'dimas',
      nim: '123200047',
      name: 'Akhmal Dimas Pratama',
      born: 'Jombang, 20 Juli 2002',
      classes: 'TPM IF-H',
      hope: 'Menjadi Pengusaha Sukses',
      image: 'assets/images/dimas.jpg'),
  Users(
      username: 'wawan',
      password: 'juan',
      nim: '123200139',
      name: 'Juan Azhar Adviseta Setiawan',
      born: 'Yogyakarta, 25 January 2003',
      classes: 'TPM IF-H',
      hope: 'Menjadi Dosen',
      image: 'assets/images/juan.jpg'),
  Users(
      username: "maulana",
      password: "daffa",
      nim: "123200130",
      name: "Maulana Daffa Ardiansyah",
      born: "Sleman, 25 Mei 2002",
      classes: "TPM-IF-H",
      hope: "Menjadi orang kaya",
      image: "assets/images/daffa.jpeg")
];
