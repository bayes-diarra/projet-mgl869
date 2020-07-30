class Role {
  String name;
  String value;

  Role({this.name, this.value});

  static List<Role> getRoles() {
    return <Role>[
      Role(name: 'Select an organization', value: null),
      Role(name: 'Manufacturer organization', value: 'Org1MSP'),
      Role(name: 'Deliver organization', value: 'Org2MSP'),
      Role(name: 'Wholesaler organization', value: 'Org3MSP'),
      Role(name: 'Patient organization', value: 'Org4MSP'),
      Role(name: 'Doctor organization', value: 'Org5MSP'),
      Role(name: 'Pharmacy organization', value: 'Org5MSP')
    ];
  }
}
