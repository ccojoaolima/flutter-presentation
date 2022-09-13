class PeopleModel {
    Name? name;
    int? age;
    String email;
    String pictureUrl;

    PeopleModel(
        {
            this.name,
            this.age,
            required this.email,
            required this.pictureUrl
        });

    static List<PeopleModel>? listPeopleModel(Map<String, dynamic> json){
        final List data = json['results'];
        final List<PeopleModel> listItems = <PeopleModel>[];
        listItems.addAll(data.map((e) {
            return PeopleModel(
                name: Name.fromJson(e['name']),
                pictureUrl: e['picture']['thumbnail'],
                age: e['dob']['age'],
                email: e['email']
            );
        }));
        print(listItems.length);
        return listItems;
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        if (name != null) {
            data['name'] = name!.toJson();
        }

        return data;
    }
}

class Name {
    String? title;
    String? first;
    String? last;

    Name({this.title, this.first, this.last});

    Name.fromJson(Map<String, dynamic> json) {
        //eh norugues
        title = json['title'];
        first = json['first'];
        last = json['last'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['title'] = title;
        data['first'] = first;
        data['last'] = last;
        return data;
    }
}
