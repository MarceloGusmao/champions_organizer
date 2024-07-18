class Jogadores {
  final String objectId;
  final String nome;
  final DateTime createdAt;
  final DateTime updatedAt;
  final JogadoresId idJogador;
  final ACL acl;

  Jogadores({
    required this.objectId,
    required this.nome,
    required this.createdAt,
    required this.updatedAt,
    required this.idJogador,
    required this.acl,
  });

  factory Jogadores.fromJson(Map<String, dynamic> json) {
    return Jogadores(
      objectId: json['objectId'],
      nome: json['nome'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      idJogador: JogadoresId.fromJson(json['idJogador']),
      acl: ACL.fromJson(json['ACL']),
    );
  }
}

class JogadoresId {
  final String type;
  final String className;
  final String objectId;

  JogadoresId({
    required this.type,
    required this.className,
    required this.objectId,
  });

  factory JogadoresId.fromJson(Map<String, dynamic> json) {
    return JogadoresId(
      type: json['__type'],
      className: json['className'],
      objectId: json['objectId'],
    );
  }
}

class ACL {
  final Permission permission;

  ACL({
    required this.permission,
  });

  factory ACL.fromJson(Map<String, dynamic> json) {
    return ACL(
      permission: Permission.fromJson(json['*']),
    );
  }
}

class Permission {
  final bool read;
  final bool write;

  Permission({
    required this.read,
    required this.write,
  });

  factory Permission.fromJson(Map<String, dynamic> json) {
    return Permission(
      read: json['read'],
      write: json['write'],
    );
  }
}