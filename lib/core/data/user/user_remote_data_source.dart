class RegisterRemotoDataSource implements RegisterDataSource {


  RegisterRemotoDataSource({@required this.client});

  @override
  Future<Either<Failure, User>> register(RegisterParams params) async {
    try {
      final response = await client.request(
        url: API_URL,
        method: 'post',
        body: params.toJson(),
      );
      return Right(UserModel.fromJson(response));
    } on HttpError catch (error) {
      return Left(error == HttpError.badRequest
          ? EmailInUseFailure()
          : ServerFailure());
    }
  }
}