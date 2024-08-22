// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trailor_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$trailorHash() => r'46ed6f7933018e1e6772803a91fc43cae8718354';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [trailor].
@ProviderFor(trailor)
const trailorProvider = TrailorFamily();

/// See also [trailor].
class TrailorFamily extends Family<AsyncValue<List<Video>>> {
  /// See also [trailor].
  const TrailorFamily();

  /// See also [trailor].
  TrailorProvider call(
    int movieId,
  ) {
    return TrailorProvider(
      movieId,
    );
  }

  @override
  TrailorProvider getProviderOverride(
    covariant TrailorProvider provider,
  ) {
    return call(
      provider.movieId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'trailorProvider';
}

/// See also [trailor].
class TrailorProvider extends AutoDisposeFutureProvider<List<Video>> {
  /// See also [trailor].
  TrailorProvider(
    int movieId,
  ) : this._internal(
          (ref) => trailor(
            ref as TrailorRef,
            movieId,
          ),
          from: trailorProvider,
          name: r'trailorProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$trailorHash,
          dependencies: TrailorFamily._dependencies,
          allTransitiveDependencies: TrailorFamily._allTransitiveDependencies,
          movieId: movieId,
        );

  TrailorProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.movieId,
  }) : super.internal();

  final int movieId;

  @override
  Override overrideWith(
    FutureOr<List<Video>> Function(TrailorRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TrailorProvider._internal(
        (ref) => create(ref as TrailorRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        movieId: movieId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Video>> createElement() {
    return _TrailorProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TrailorProvider && other.movieId == movieId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, movieId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TrailorRef on AutoDisposeFutureProviderRef<List<Video>> {
  /// The parameter `movieId` of this provider.
  int get movieId;
}

class _TrailorProviderElement
    extends AutoDisposeFutureProviderElement<List<Video>> with TrailorRef {
  _TrailorProviderElement(super.provider);

  @override
  int get movieId => (origin as TrailorProvider).movieId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
