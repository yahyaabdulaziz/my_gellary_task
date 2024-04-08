class MyGalleryCollection {
  Info? info;
  List<Item>? item;
  List<Event>? event;
  List<Variable>? variable;

  MyGalleryCollection({this.info, this.item, this.event, this.variable});

  factory MyGalleryCollection.fromJson(Map<String, dynamic> json) {
    return MyGalleryCollection(
      info: Info.fromJson(json['info']),
      item: List<Item>.from(json['item'].map((x) => Item.fromJson(x))),
      event: List<Event>.from(json['event'].map((x) => Event.fromJson(x))),
      variable: List<Variable>.from(
          json['variable'].map((x) => Variable.fromJson(x))),
    );
  }
}

class Info {
  String? postmanId;
  String? name;
  String? schema;
  String? exporterId;

  Info({this.postmanId, this.name, this.schema, this.exporterId});

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      postmanId: json['_postman_id'],
      name: json['name'],
      schema: json['schema'],
      exporterId: json['_exporter_id'],
    );
  }
}

class Item {
  String? name;
  Request? request;
  List<Response>? response;

  Item({this.name, this.request, this.response});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      name: json['name'],
      request: Request.fromJson(json['request']),
      response: List<Response>.from(
          json['response'].map((x) => Response.fromJson(x))),
    );
  }
}

class Request {
  String? method;
  List<dynamic>? header;
  Body? body;
  Url? url;

  Request({this.method, this.header, this.body, this.url});

  factory Request.fromJson(Map<String, dynamic> json) {
    return Request(
      method: json['method'],
      header: json['header'],
      body: Body.fromJson(json['body']),
      url: Url.fromJson(json['url']),
    );
  }
}

class Body {
  String? mode;
  List<Formdata>? formdata;

  Body({this.mode, this.formdata});

  factory Body.fromJson(Map<String, dynamic> json) {
    return Body(
      mode: json['mode'],
      formdata: List<Formdata>.from(
          json['formdata'].map((x) => Formdata.fromJson(x))),
    );
  }
}

class Formdata {
  String? key;
  dynamic value;
  String? type;
  String? src;

  Formdata({this.key, this.value, this.type, this.src});

  factory Formdata.fromJson(Map<String, dynamic> json) {
    return Formdata(
      key: json['key'],
      value: json['value'],
      type: json['type'],
      src: json['src'],
    );
  }
}

class Url {
  String? raw;
  List<String>? host;
  List<String>? path;

  Url({this.raw, this.host, this.path});

  factory Url.fromJson(Map<String, dynamic> json) {
    return Url(
      raw: json['raw'],
      host: List<String>.from(json['host']),
      path: List<String>.from(json['path']),
    );
  }
}

class Response {
  String? name;
  OriginalRequest? originalRequest;
  String? status;
  int? code;
  String? postmanPreviewlanguage;
  List<dynamic>? header;
  List<dynamic>? cookie;
  String? body;

  Response(
      {this.name,
      this.originalRequest,
      this.status,
      this.code,
      this.postmanPreviewlanguage,
      this.header,
      this.cookie,
      this.body});

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      name: json['name'],
      originalRequest: OriginalRequest.fromJson(json['originalRequest']),
      status: json['status'],
      code: json['code'],
      postmanPreviewlanguage: json['_postman_previewlanguage'],
      header: json['header'],
      cookie: json['cookie'],
      body: json['body'],
    );
  }
}

class OriginalRequest {
  String? method;
  List<dynamic>? header;
  Body? body;
  Url? url;

  OriginalRequest({this.method, this.header, this.body, this.url});

  factory OriginalRequest.fromJson(Map<String, dynamic> json) {
    return OriginalRequest(
      method: json['method'],
      header: json['header'],
      body: Body.fromJson(json['body']),
      url: Url.fromJson(json['url']),
    );
  }
}

class Event {
  String? listen;
  Script? script;

  Event({this.listen, this.script});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      listen: json['listen'],
      script: Script.fromJson(json['script']),
    );
  }
}

class Script {
  String? type;
  List<String>? exec;

  Script({this.type, this.exec});

  factory Script.fromJson(Map<String, dynamic> json) {
    return Script(
      type: json['type'],
      exec: List<String>.from(json['exec']),
    );
  }
}

class Variable {
  String? key;
  String? value;
  String? type;

  Variable({this.key, this.value, this.type});

  factory Variable.fromJson(Map<String, dynamic> json) {
    return Variable(
      key: json['key'],
      value: json['value'],
      type: json['type'],
    );
  }
}
