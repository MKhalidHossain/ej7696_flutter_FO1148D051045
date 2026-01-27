import 'user_model.dart';

class UsersMeta {
  final int page;
  final int limit;
  final int total;
  final int totalPages;

  UsersMeta({
    required this.page,
    required this.limit,
    required this.total,
    required this.totalPages,
  });

  factory UsersMeta.fromJson(Map<String, dynamic> json) {
    return UsersMeta(
      page: json['page'] ?? 1,
      limit: json['limit'] ?? 10,
      total: json['total'] ?? 0,
      totalPages: json['totalPages'] ?? 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'limit': limit,
      'total': total,
      'totalPages': totalPages,
    };
  }
}

class UsersResponse {
  final List<UserModel> users;
  final UsersMeta meta;

  UsersResponse({
    required this.users,
    required this.meta,
  });

  factory UsersResponse.fromJson(Map<String, dynamic> json) {
    return UsersResponse(
      users: (json['users'] as List<dynamic>?)
              ?.map((item) => UserModel.fromJson(item))
              .toList() ??
          [],
      meta: UsersMeta.fromJson(json['meta'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'users': users.map((user) => user.toJson()).toList(),
      'meta': meta.toJson(),
    };
  }
}
