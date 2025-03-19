
/**
 * Client
**/

import * as runtime from './runtime/library.js';
import $Types = runtime.Types // general types
import $Public = runtime.Types.Public
import $Utils = runtime.Types.Utils
import $Extensions = runtime.Types.Extensions
import $Result = runtime.Types.Result

export type PrismaPromise<T> = $Public.PrismaPromise<T>


/**
 * Model options
 * 
 */
export type options = $Result.DefaultSelection<Prisma.$optionsPayload>
/**
 * Model devices
 * 
 */
export type devices = $Result.DefaultSelection<Prisma.$devicesPayload>
/**
 * Model customers
 * 
 */
export type customers = $Result.DefaultSelection<Prisma.$customersPayload>

/**
 * ##  Prisma Client ʲˢ
 * 
 * Type-safe database client for TypeScript & Node.js
 * @example
 * ```
 * const prisma = new PrismaClient()
 * // Fetch zero or more Options
 * const options = await prisma.options.findMany()
 * ```
 *
 * 
 * Read more in our [docs](https://www.prisma.io/docs/reference/tools-and-interfaces/prisma-client).
 */
export class PrismaClient<
  ClientOptions extends Prisma.PrismaClientOptions = Prisma.PrismaClientOptions,
  U = 'log' extends keyof ClientOptions ? ClientOptions['log'] extends Array<Prisma.LogLevel | Prisma.LogDefinition> ? Prisma.GetEvents<ClientOptions['log']> : never : never,
  ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs
> {
  [K: symbol]: { types: Prisma.TypeMap<ExtArgs>['other'] }

    /**
   * ##  Prisma Client ʲˢ
   * 
   * Type-safe database client for TypeScript & Node.js
   * @example
   * ```
   * const prisma = new PrismaClient()
   * // Fetch zero or more Options
   * const options = await prisma.options.findMany()
   * ```
   *
   * 
   * Read more in our [docs](https://www.prisma.io/docs/reference/tools-and-interfaces/prisma-client).
   */

  constructor(optionsArg ?: Prisma.Subset<ClientOptions, Prisma.PrismaClientOptions>);
  $on<V extends U>(eventType: V, callback: (event: V extends 'query' ? Prisma.QueryEvent : Prisma.LogEvent) => void): void;

  /**
   * Connect with the database
   */
  $connect(): $Utils.JsPromise<void>;

  /**
   * Disconnect from the database
   */
  $disconnect(): $Utils.JsPromise<void>;

  /**
   * Add a middleware
   * @deprecated since 4.16.0. For new code, prefer client extensions instead.
   * @see https://pris.ly/d/extensions
   */
  $use(cb: Prisma.Middleware): void

/**
   * Executes a prepared raw query and returns the number of affected rows.
   * @example
   * ```
   * const result = await prisma.$executeRaw`UPDATE User SET cool = ${true} WHERE email = ${'user@email.com'};`
   * ```
   * 
   * Read more in our [docs](https://www.prisma.io/docs/reference/tools-and-interfaces/prisma-client/raw-database-access).
   */
  $executeRaw<T = unknown>(query: TemplateStringsArray | Prisma.Sql, ...values: any[]): Prisma.PrismaPromise<number>;

  /**
   * Executes a raw query and returns the number of affected rows.
   * Susceptible to SQL injections, see documentation.
   * @example
   * ```
   * const result = await prisma.$executeRawUnsafe('UPDATE User SET cool = $1 WHERE email = $2 ;', true, 'user@email.com')
   * ```
   * 
   * Read more in our [docs](https://www.prisma.io/docs/reference/tools-and-interfaces/prisma-client/raw-database-access).
   */
  $executeRawUnsafe<T = unknown>(query: string, ...values: any[]): Prisma.PrismaPromise<number>;

  /**
   * Performs a prepared raw query and returns the `SELECT` data.
   * @example
   * ```
   * const result = await prisma.$queryRaw`SELECT * FROM User WHERE id = ${1} OR email = ${'user@email.com'};`
   * ```
   * 
   * Read more in our [docs](https://www.prisma.io/docs/reference/tools-and-interfaces/prisma-client/raw-database-access).
   */
  $queryRaw<T = unknown>(query: TemplateStringsArray | Prisma.Sql, ...values: any[]): Prisma.PrismaPromise<T>;

  /**
   * Performs a raw query and returns the `SELECT` data.
   * Susceptible to SQL injections, see documentation.
   * @example
   * ```
   * const result = await prisma.$queryRawUnsafe('SELECT * FROM User WHERE id = $1 OR email = $2;', 1, 'user@email.com')
   * ```
   * 
   * Read more in our [docs](https://www.prisma.io/docs/reference/tools-and-interfaces/prisma-client/raw-database-access).
   */
  $queryRawUnsafe<T = unknown>(query: string, ...values: any[]): Prisma.PrismaPromise<T>;


  /**
   * Allows the running of a sequence of read/write operations that are guaranteed to either succeed or fail as a whole.
   * @example
   * ```
   * const [george, bob, alice] = await prisma.$transaction([
   *   prisma.user.create({ data: { name: 'George' } }),
   *   prisma.user.create({ data: { name: 'Bob' } }),
   *   prisma.user.create({ data: { name: 'Alice' } }),
   * ])
   * ```
   * 
   * Read more in our [docs](https://www.prisma.io/docs/concepts/components/prisma-client/transactions).
   */
  $transaction<P extends Prisma.PrismaPromise<any>[]>(arg: [...P], options?: { isolationLevel?: Prisma.TransactionIsolationLevel }): $Utils.JsPromise<runtime.Types.Utils.UnwrapTuple<P>>

  $transaction<R>(fn: (prisma: Omit<PrismaClient, runtime.ITXClientDenyList>) => $Utils.JsPromise<R>, options?: { maxWait?: number, timeout?: number, isolationLevel?: Prisma.TransactionIsolationLevel }): $Utils.JsPromise<R>


  $extends: $Extensions.ExtendsHook<"extends", Prisma.TypeMapCb, ExtArgs>

      /**
   * `prisma.options`: Exposes CRUD operations for the **options** model.
    * Example usage:
    * ```ts
    * // Fetch zero or more Options
    * const options = await prisma.options.findMany()
    * ```
    */
  get options(): Prisma.optionsDelegate<ExtArgs>;

  /**
   * `prisma.devices`: Exposes CRUD operations for the **devices** model.
    * Example usage:
    * ```ts
    * // Fetch zero or more Devices
    * const devices = await prisma.devices.findMany()
    * ```
    */
  get devices(): Prisma.devicesDelegate<ExtArgs>;

  /**
   * `prisma.customers`: Exposes CRUD operations for the **customers** model.
    * Example usage:
    * ```ts
    * // Fetch zero or more Customers
    * const customers = await prisma.customers.findMany()
    * ```
    */
  get customers(): Prisma.customersDelegate<ExtArgs>;
}

export namespace Prisma {
  export import DMMF = runtime.DMMF

  export type PrismaPromise<T> = $Public.PrismaPromise<T>

  /**
   * Validator
   */
  export import validator = runtime.Public.validator

  /**
   * Prisma Errors
   */
  export import PrismaClientKnownRequestError = runtime.PrismaClientKnownRequestError
  export import PrismaClientUnknownRequestError = runtime.PrismaClientUnknownRequestError
  export import PrismaClientRustPanicError = runtime.PrismaClientRustPanicError
  export import PrismaClientInitializationError = runtime.PrismaClientInitializationError
  export import PrismaClientValidationError = runtime.PrismaClientValidationError

  /**
   * Re-export of sql-template-tag
   */
  export import sql = runtime.sqltag
  export import empty = runtime.empty
  export import join = runtime.join
  export import raw = runtime.raw
  export import Sql = runtime.Sql



  /**
   * Decimal.js
   */
  export import Decimal = runtime.Decimal

  export type DecimalJsLike = runtime.DecimalJsLike

  /**
   * Metrics 
   */
  export type Metrics = runtime.Metrics
  export type Metric<T> = runtime.Metric<T>
  export type MetricHistogram = runtime.MetricHistogram
  export type MetricHistogramBucket = runtime.MetricHistogramBucket

  /**
  * Extensions
  */
  export import Extension = $Extensions.UserArgs
  export import getExtensionContext = runtime.Extensions.getExtensionContext
  export import Args = $Public.Args
  export import Payload = $Public.Payload
  export import Result = $Public.Result
  export import Exact = $Public.Exact

  /**
   * Prisma Client JS version: 6.0.1
   * Query Engine version: 5dbef10bdbfb579e07d35cc85fb1518d357cb99e
   */
  export type PrismaVersion = {
    client: string
  }

  export const prismaVersion: PrismaVersion 

  /**
   * Utility Types
   */


  export import JsonObject = runtime.JsonObject
  export import JsonArray = runtime.JsonArray
  export import JsonValue = runtime.JsonValue
  export import InputJsonObject = runtime.InputJsonObject
  export import InputJsonArray = runtime.InputJsonArray
  export import InputJsonValue = runtime.InputJsonValue

  /**
   * Types of the values used to represent different kinds of `null` values when working with JSON fields.
   * 
   * @see https://www.prisma.io/docs/concepts/components/prisma-client/working-with-fields/working-with-json-fields#filtering-on-a-json-field
   */
  namespace NullTypes {
    /**
    * Type of `Prisma.DbNull`.
    * 
    * You cannot use other instances of this class. Please use the `Prisma.DbNull` value.
    * 
    * @see https://www.prisma.io/docs/concepts/components/prisma-client/working-with-fields/working-with-json-fields#filtering-on-a-json-field
    */
    class DbNull {
      private DbNull: never
      private constructor()
    }

    /**
    * Type of `Prisma.JsonNull`.
    * 
    * You cannot use other instances of this class. Please use the `Prisma.JsonNull` value.
    * 
    * @see https://www.prisma.io/docs/concepts/components/prisma-client/working-with-fields/working-with-json-fields#filtering-on-a-json-field
    */
    class JsonNull {
      private JsonNull: never
      private constructor()
    }

    /**
    * Type of `Prisma.AnyNull`.
    * 
    * You cannot use other instances of this class. Please use the `Prisma.AnyNull` value.
    * 
    * @see https://www.prisma.io/docs/concepts/components/prisma-client/working-with-fields/working-with-json-fields#filtering-on-a-json-field
    */
    class AnyNull {
      private AnyNull: never
      private constructor()
    }
  }

  /**
   * Helper for filtering JSON entries that have `null` on the database (empty on the db)
   * 
   * @see https://www.prisma.io/docs/concepts/components/prisma-client/working-with-fields/working-with-json-fields#filtering-on-a-json-field
   */
  export const DbNull: NullTypes.DbNull

  /**
   * Helper for filtering JSON entries that have JSON `null` values (not empty on the db)
   * 
   * @see https://www.prisma.io/docs/concepts/components/prisma-client/working-with-fields/working-with-json-fields#filtering-on-a-json-field
   */
  export const JsonNull: NullTypes.JsonNull

  /**
   * Helper for filtering JSON entries that are `Prisma.DbNull` or `Prisma.JsonNull`
   * 
   * @see https://www.prisma.io/docs/concepts/components/prisma-client/working-with-fields/working-with-json-fields#filtering-on-a-json-field
   */
  export const AnyNull: NullTypes.AnyNull

  type SelectAndInclude = {
    select: any
    include: any
  }

  type SelectAndOmit = {
    select: any
    omit: any
  }

  /**
   * Get the type of the value, that the Promise holds.
   */
  export type PromiseType<T extends PromiseLike<any>> = T extends PromiseLike<infer U> ? U : T;

  /**
   * Get the return type of a function which returns a Promise.
   */
  export type PromiseReturnType<T extends (...args: any) => $Utils.JsPromise<any>> = PromiseType<ReturnType<T>>

  /**
   * From T, pick a set of properties whose keys are in the union K
   */
  type Prisma__Pick<T, K extends keyof T> = {
      [P in K]: T[P];
  };


  export type Enumerable<T> = T | Array<T>;

  export type RequiredKeys<T> = {
    [K in keyof T]-?: {} extends Prisma__Pick<T, K> ? never : K
  }[keyof T]

  export type TruthyKeys<T> = keyof {
    [K in keyof T as T[K] extends false | undefined | null ? never : K]: K
  }

  export type TrueKeys<T> = TruthyKeys<Prisma__Pick<T, RequiredKeys<T>>>

  /**
   * Subset
   * @desc From `T` pick properties that exist in `U`. Simple version of Intersection
   */
  export type Subset<T, U> = {
    [key in keyof T]: key extends keyof U ? T[key] : never;
  };

  /**
   * SelectSubset
   * @desc From `T` pick properties that exist in `U`. Simple version of Intersection.
   * Additionally, it validates, if both select and include are present. If the case, it errors.
   */
  export type SelectSubset<T, U> = {
    [key in keyof T]: key extends keyof U ? T[key] : never
  } &
    (T extends SelectAndInclude
      ? 'Please either choose `select` or `include`.'
      : T extends SelectAndOmit
        ? 'Please either choose `select` or `omit`.'
        : {})

  /**
   * Subset + Intersection
   * @desc From `T` pick properties that exist in `U` and intersect `K`
   */
  export type SubsetIntersection<T, U, K> = {
    [key in keyof T]: key extends keyof U ? T[key] : never
  } &
    K

  type Without<T, U> = { [P in Exclude<keyof T, keyof U>]?: never };

  /**
   * XOR is needed to have a real mutually exclusive union type
   * https://stackoverflow.com/questions/42123407/does-typescript-support-mutually-exclusive-types
   */
  type XOR<T, U> =
    T extends object ?
    U extends object ?
      (Without<T, U> & U) | (Without<U, T> & T)
    : U : T


  /**
   * Is T a Record?
   */
  type IsObject<T extends any> = T extends Array<any>
  ? False
  : T extends Date
  ? False
  : T extends Uint8Array
  ? False
  : T extends BigInt
  ? False
  : T extends object
  ? True
  : False


  /**
   * If it's T[], return T
   */
  export type UnEnumerate<T extends unknown> = T extends Array<infer U> ? U : T

  /**
   * From ts-toolbelt
   */

  type __Either<O extends object, K extends Key> = Omit<O, K> &
    {
      // Merge all but K
      [P in K]: Prisma__Pick<O, P & keyof O> // With K possibilities
    }[K]

  type EitherStrict<O extends object, K extends Key> = Strict<__Either<O, K>>

  type EitherLoose<O extends object, K extends Key> = ComputeRaw<__Either<O, K>>

  type _Either<
    O extends object,
    K extends Key,
    strict extends Boolean
  > = {
    1: EitherStrict<O, K>
    0: EitherLoose<O, K>
  }[strict]

  type Either<
    O extends object,
    K extends Key,
    strict extends Boolean = 1
  > = O extends unknown ? _Either<O, K, strict> : never

  export type Union = any

  type PatchUndefined<O extends object, O1 extends object> = {
    [K in keyof O]: O[K] extends undefined ? At<O1, K> : O[K]
  } & {}

  /** Helper Types for "Merge" **/
  export type IntersectOf<U extends Union> = (
    U extends unknown ? (k: U) => void : never
  ) extends (k: infer I) => void
    ? I
    : never

  export type Overwrite<O extends object, O1 extends object> = {
      [K in keyof O]: K extends keyof O1 ? O1[K] : O[K];
  } & {};

  type _Merge<U extends object> = IntersectOf<Overwrite<U, {
      [K in keyof U]-?: At<U, K>;
  }>>;

  type Key = string | number | symbol;
  type AtBasic<O extends object, K extends Key> = K extends keyof O ? O[K] : never;
  type AtStrict<O extends object, K extends Key> = O[K & keyof O];
  type AtLoose<O extends object, K extends Key> = O extends unknown ? AtStrict<O, K> : never;
  export type At<O extends object, K extends Key, strict extends Boolean = 1> = {
      1: AtStrict<O, K>;
      0: AtLoose<O, K>;
  }[strict];

  export type ComputeRaw<A extends any> = A extends Function ? A : {
    [K in keyof A]: A[K];
  } & {};

  export type OptionalFlat<O> = {
    [K in keyof O]?: O[K];
  } & {};

  type _Record<K extends keyof any, T> = {
    [P in K]: T;
  };

  // cause typescript not to expand types and preserve names
  type NoExpand<T> = T extends unknown ? T : never;

  // this type assumes the passed object is entirely optional
  type AtLeast<O extends object, K extends string> = NoExpand<
    O extends unknown
    ? | (K extends keyof O ? { [P in K]: O[P] } & O : O)
      | {[P in keyof O as P extends K ? K : never]-?: O[P]} & O
    : never>;

  type _Strict<U, _U = U> = U extends unknown ? U & OptionalFlat<_Record<Exclude<Keys<_U>, keyof U>, never>> : never;

  export type Strict<U extends object> = ComputeRaw<_Strict<U>>;
  /** End Helper Types for "Merge" **/

  export type Merge<U extends object> = ComputeRaw<_Merge<Strict<U>>>;

  /**
  A [[Boolean]]
  */
  export type Boolean = True | False

  // /**
  // 1
  // */
  export type True = 1

  /**
  0
  */
  export type False = 0

  export type Not<B extends Boolean> = {
    0: 1
    1: 0
  }[B]

  export type Extends<A1 extends any, A2 extends any> = [A1] extends [never]
    ? 0 // anything `never` is false
    : A1 extends A2
    ? 1
    : 0

  export type Has<U extends Union, U1 extends Union> = Not<
    Extends<Exclude<U1, U>, U1>
  >

  export type Or<B1 extends Boolean, B2 extends Boolean> = {
    0: {
      0: 0
      1: 1
    }
    1: {
      0: 1
      1: 1
    }
  }[B1][B2]

  export type Keys<U extends Union> = U extends unknown ? keyof U : never

  type Cast<A, B> = A extends B ? A : B;

  export const type: unique symbol;



  /**
   * Used by group by
   */

  export type GetScalarType<T, O> = O extends object ? {
    [P in keyof T]: P extends keyof O
      ? O[P]
      : never
  } : never

  type FieldPaths<
    T,
    U = Omit<T, '_avg' | '_sum' | '_count' | '_min' | '_max'>
  > = IsObject<T> extends True ? U : T

  type GetHavingFields<T> = {
    [K in keyof T]: Or<
      Or<Extends<'OR', K>, Extends<'AND', K>>,
      Extends<'NOT', K>
    > extends True
      ? // infer is only needed to not hit TS limit
        // based on the brilliant idea of Pierre-Antoine Mills
        // https://github.com/microsoft/TypeScript/issues/30188#issuecomment-478938437
        T[K] extends infer TK
        ? GetHavingFields<UnEnumerate<TK> extends object ? Merge<UnEnumerate<TK>> : never>
        : never
      : {} extends FieldPaths<T[K]>
      ? never
      : K
  }[keyof T]

  /**
   * Convert tuple to union
   */
  type _TupleToUnion<T> = T extends (infer E)[] ? E : never
  type TupleToUnion<K extends readonly any[]> = _TupleToUnion<K>
  type MaybeTupleToUnion<T> = T extends any[] ? TupleToUnion<T> : T

  /**
   * Like `Pick`, but additionally can also accept an array of keys
   */
  type PickEnumerable<T, K extends Enumerable<keyof T> | keyof T> = Prisma__Pick<T, MaybeTupleToUnion<K>>

  /**
   * Exclude all keys with underscores
   */
  type ExcludeUnderscoreKeys<T extends string> = T extends `_${string}` ? never : T


  export type FieldRef<Model, FieldType> = runtime.FieldRef<Model, FieldType>

  type FieldRefInputType<Model, FieldType> = Model extends never ? never : FieldRef<Model, FieldType>


  export const ModelName: {
    options: 'options',
    devices: 'devices',
    customers: 'customers'
  };

  export type ModelName = (typeof ModelName)[keyof typeof ModelName]


  export type Datasources = {
    db?: Datasource
  }

  interface TypeMapCb extends $Utils.Fn<{extArgs: $Extensions.InternalArgs, clientOptions: PrismaClientOptions }, $Utils.Record<string, any>> {
    returns: Prisma.TypeMap<this['params']['extArgs'], this['params']['clientOptions']>
  }

  export type TypeMap<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs, ClientOptions = {}> = {
    meta: {
      modelProps: "options" | "devices" | "customers"
      txIsolationLevel: Prisma.TransactionIsolationLevel
    }
    model: {
      options: {
        payload: Prisma.$optionsPayload<ExtArgs>
        fields: Prisma.optionsFieldRefs
        operations: {
          findUnique: {
            args: Prisma.optionsFindUniqueArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$optionsPayload> | null
          }
          findUniqueOrThrow: {
            args: Prisma.optionsFindUniqueOrThrowArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$optionsPayload>
          }
          findFirst: {
            args: Prisma.optionsFindFirstArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$optionsPayload> | null
          }
          findFirstOrThrow: {
            args: Prisma.optionsFindFirstOrThrowArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$optionsPayload>
          }
          findMany: {
            args: Prisma.optionsFindManyArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$optionsPayload>[]
          }
          create: {
            args: Prisma.optionsCreateArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$optionsPayload>
          }
          createMany: {
            args: Prisma.optionsCreateManyArgs<ExtArgs>
            result: BatchPayload
          }
          createManyAndReturn: {
            args: Prisma.optionsCreateManyAndReturnArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$optionsPayload>[]
          }
          delete: {
            args: Prisma.optionsDeleteArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$optionsPayload>
          }
          update: {
            args: Prisma.optionsUpdateArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$optionsPayload>
          }
          deleteMany: {
            args: Prisma.optionsDeleteManyArgs<ExtArgs>
            result: BatchPayload
          }
          updateMany: {
            args: Prisma.optionsUpdateManyArgs<ExtArgs>
            result: BatchPayload
          }
          upsert: {
            args: Prisma.optionsUpsertArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$optionsPayload>
          }
          aggregate: {
            args: Prisma.OptionsAggregateArgs<ExtArgs>
            result: $Utils.Optional<AggregateOptions>
          }
          groupBy: {
            args: Prisma.optionsGroupByArgs<ExtArgs>
            result: $Utils.Optional<OptionsGroupByOutputType>[]
          }
          count: {
            args: Prisma.optionsCountArgs<ExtArgs>
            result: $Utils.Optional<OptionsCountAggregateOutputType> | number
          }
        }
      }
      devices: {
        payload: Prisma.$devicesPayload<ExtArgs>
        fields: Prisma.devicesFieldRefs
        operations: {
          findUnique: {
            args: Prisma.devicesFindUniqueArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$devicesPayload> | null
          }
          findUniqueOrThrow: {
            args: Prisma.devicesFindUniqueOrThrowArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$devicesPayload>
          }
          findFirst: {
            args: Prisma.devicesFindFirstArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$devicesPayload> | null
          }
          findFirstOrThrow: {
            args: Prisma.devicesFindFirstOrThrowArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$devicesPayload>
          }
          findMany: {
            args: Prisma.devicesFindManyArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$devicesPayload>[]
          }
          create: {
            args: Prisma.devicesCreateArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$devicesPayload>
          }
          createMany: {
            args: Prisma.devicesCreateManyArgs<ExtArgs>
            result: BatchPayload
          }
          createManyAndReturn: {
            args: Prisma.devicesCreateManyAndReturnArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$devicesPayload>[]
          }
          delete: {
            args: Prisma.devicesDeleteArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$devicesPayload>
          }
          update: {
            args: Prisma.devicesUpdateArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$devicesPayload>
          }
          deleteMany: {
            args: Prisma.devicesDeleteManyArgs<ExtArgs>
            result: BatchPayload
          }
          updateMany: {
            args: Prisma.devicesUpdateManyArgs<ExtArgs>
            result: BatchPayload
          }
          upsert: {
            args: Prisma.devicesUpsertArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$devicesPayload>
          }
          aggregate: {
            args: Prisma.DevicesAggregateArgs<ExtArgs>
            result: $Utils.Optional<AggregateDevices>
          }
          groupBy: {
            args: Prisma.devicesGroupByArgs<ExtArgs>
            result: $Utils.Optional<DevicesGroupByOutputType>[]
          }
          count: {
            args: Prisma.devicesCountArgs<ExtArgs>
            result: $Utils.Optional<DevicesCountAggregateOutputType> | number
          }
        }
      }
      customers: {
        payload: Prisma.$customersPayload<ExtArgs>
        fields: Prisma.customersFieldRefs
        operations: {
          findUnique: {
            args: Prisma.customersFindUniqueArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$customersPayload> | null
          }
          findUniqueOrThrow: {
            args: Prisma.customersFindUniqueOrThrowArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$customersPayload>
          }
          findFirst: {
            args: Prisma.customersFindFirstArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$customersPayload> | null
          }
          findFirstOrThrow: {
            args: Prisma.customersFindFirstOrThrowArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$customersPayload>
          }
          findMany: {
            args: Prisma.customersFindManyArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$customersPayload>[]
          }
          create: {
            args: Prisma.customersCreateArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$customersPayload>
          }
          createMany: {
            args: Prisma.customersCreateManyArgs<ExtArgs>
            result: BatchPayload
          }
          createManyAndReturn: {
            args: Prisma.customersCreateManyAndReturnArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$customersPayload>[]
          }
          delete: {
            args: Prisma.customersDeleteArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$customersPayload>
          }
          update: {
            args: Prisma.customersUpdateArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$customersPayload>
          }
          deleteMany: {
            args: Prisma.customersDeleteManyArgs<ExtArgs>
            result: BatchPayload
          }
          updateMany: {
            args: Prisma.customersUpdateManyArgs<ExtArgs>
            result: BatchPayload
          }
          upsert: {
            args: Prisma.customersUpsertArgs<ExtArgs>
            result: $Utils.PayloadToResult<Prisma.$customersPayload>
          }
          aggregate: {
            args: Prisma.CustomersAggregateArgs<ExtArgs>
            result: $Utils.Optional<AggregateCustomers>
          }
          groupBy: {
            args: Prisma.customersGroupByArgs<ExtArgs>
            result: $Utils.Optional<CustomersGroupByOutputType>[]
          }
          count: {
            args: Prisma.customersCountArgs<ExtArgs>
            result: $Utils.Optional<CustomersCountAggregateOutputType> | number
          }
        }
      }
    }
  } & {
    other: {
      payload: any
      operations: {
        $executeRaw: {
          args: [query: TemplateStringsArray | Prisma.Sql, ...values: any[]],
          result: any
        }
        $executeRawUnsafe: {
          args: [query: string, ...values: any[]],
          result: any
        }
        $queryRaw: {
          args: [query: TemplateStringsArray | Prisma.Sql, ...values: any[]],
          result: any
        }
        $queryRawUnsafe: {
          args: [query: string, ...values: any[]],
          result: any
        }
      }
    }
  }
  export const defineExtension: $Extensions.ExtendsHook<"define", Prisma.TypeMapCb, $Extensions.DefaultArgs>
  export type DefaultPrismaClient = PrismaClient
  export type ErrorFormat = 'pretty' | 'colorless' | 'minimal'
  export interface PrismaClientOptions {
    /**
     * Overwrites the datasource url from your schema.prisma file
     */
    datasources?: Datasources
    /**
     * Overwrites the datasource url from your schema.prisma file
     */
    datasourceUrl?: string
    /**
     * @default "colorless"
     */
    errorFormat?: ErrorFormat
    /**
     * @example
     * ```
     * // Defaults to stdout
     * log: ['query', 'info', 'warn', 'error']
     * 
     * // Emit as events
     * log: [
     *   { emit: 'stdout', level: 'query' },
     *   { emit: 'stdout', level: 'info' },
     *   { emit: 'stdout', level: 'warn' }
     *   { emit: 'stdout', level: 'error' }
     * ]
     * ```
     * Read more in our [docs](https://www.prisma.io/docs/reference/tools-and-interfaces/prisma-client/logging#the-log-option).
     */
    log?: (LogLevel | LogDefinition)[]
    /**
     * The default values for transactionOptions
     * maxWait ?= 2000
     * timeout ?= 5000
     */
    transactionOptions?: {
      maxWait?: number
      timeout?: number
      isolationLevel?: Prisma.TransactionIsolationLevel
    }
  }


  /* Types for Logging */
  export type LogLevel = 'info' | 'query' | 'warn' | 'error'
  export type LogDefinition = {
    level: LogLevel
    emit: 'stdout' | 'event'
  }

  export type GetLogType<T extends LogLevel | LogDefinition> = T extends LogDefinition ? T['emit'] extends 'event' ? T['level'] : never : never
  export type GetEvents<T extends any> = T extends Array<LogLevel | LogDefinition> ?
    GetLogType<T[0]> | GetLogType<T[1]> | GetLogType<T[2]> | GetLogType<T[3]>
    : never

  export type QueryEvent = {
    timestamp: Date
    query: string
    params: string
    duration: number
    target: string
  }

  export type LogEvent = {
    timestamp: Date
    message: string
    target: string
  }
  /* End Types for Logging */


  export type PrismaAction =
    | 'findUnique'
    | 'findUniqueOrThrow'
    | 'findMany'
    | 'findFirst'
    | 'findFirstOrThrow'
    | 'create'
    | 'createMany'
    | 'createManyAndReturn'
    | 'update'
    | 'updateMany'
    | 'upsert'
    | 'delete'
    | 'deleteMany'
    | 'executeRaw'
    | 'queryRaw'
    | 'aggregate'
    | 'count'
    | 'runCommandRaw'
    | 'findRaw'
    | 'groupBy'

  /**
   * These options are being passed into the middleware as "params"
   */
  export type MiddlewareParams = {
    model?: ModelName
    action: PrismaAction
    args: any
    dataPath: string[]
    runInTransaction: boolean
  }

  /**
   * The `T` type makes sure, that the `return proceed` is not forgotten in the middleware implementation
   */
  export type Middleware<T = any> = (
    params: MiddlewareParams,
    next: (params: MiddlewareParams) => $Utils.JsPromise<T>,
  ) => $Utils.JsPromise<T>

  // tested in getLogLevel.test.ts
  export function getLogLevel(log: Array<LogLevel | LogDefinition>): LogLevel | undefined;

  /**
   * `PrismaClient` proxy available in interactive transactions.
   */
  export type TransactionClient = Omit<Prisma.DefaultPrismaClient, runtime.ITXClientDenyList>

  export type Datasource = {
    url?: string
  }

  /**
   * Count Types
   */



  /**
   * Models
   */

  /**
   * Model options
   */

  export type AggregateOptions = {
    _count: OptionsCountAggregateOutputType | null
    _avg: OptionsAvgAggregateOutputType | null
    _sum: OptionsSumAggregateOutputType | null
    _min: OptionsMinAggregateOutputType | null
    _max: OptionsMaxAggregateOutputType | null
  }

  export type OptionsAvgAggregateOutputType = {
    id: number | null
  }

  export type OptionsSumAggregateOutputType = {
    id: number | null
  }

  export type OptionsMinAggregateOutputType = {
    id: number | null
    group: string | null
    key: string | null
    value: string | null
    is_serialize: boolean | null
  }

  export type OptionsMaxAggregateOutputType = {
    id: number | null
    group: string | null
    key: string | null
    value: string | null
    is_serialize: boolean | null
  }

  export type OptionsCountAggregateOutputType = {
    id: number
    group: number
    key: number
    value: number
    is_serialize: number
    _all: number
  }


  export type OptionsAvgAggregateInputType = {
    id?: true
  }

  export type OptionsSumAggregateInputType = {
    id?: true
  }

  export type OptionsMinAggregateInputType = {
    id?: true
    group?: true
    key?: true
    value?: true
    is_serialize?: true
  }

  export type OptionsMaxAggregateInputType = {
    id?: true
    group?: true
    key?: true
    value?: true
    is_serialize?: true
  }

  export type OptionsCountAggregateInputType = {
    id?: true
    group?: true
    key?: true
    value?: true
    is_serialize?: true
    _all?: true
  }

  export type OptionsAggregateArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Filter which options to aggregate.
     */
    where?: optionsWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of options to fetch.
     */
    orderBy?: optionsOrderByWithRelationInput | optionsOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the start position
     */
    cursor?: optionsWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` options from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` options.
     */
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Count returned options
    **/
    _count?: true | OptionsCountAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to average
    **/
    _avg?: OptionsAvgAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to sum
    **/
    _sum?: OptionsSumAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to find the minimum value
    **/
    _min?: OptionsMinAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to find the maximum value
    **/
    _max?: OptionsMaxAggregateInputType
  }

  export type GetOptionsAggregateType<T extends OptionsAggregateArgs> = {
        [P in keyof T & keyof AggregateOptions]: P extends '_count' | 'count'
      ? T[P] extends true
        ? number
        : GetScalarType<T[P], AggregateOptions[P]>
      : GetScalarType<T[P], AggregateOptions[P]>
  }




  export type optionsGroupByArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    where?: optionsWhereInput
    orderBy?: optionsOrderByWithAggregationInput | optionsOrderByWithAggregationInput[]
    by: OptionsScalarFieldEnum[] | OptionsScalarFieldEnum
    having?: optionsScalarWhereWithAggregatesInput
    take?: number
    skip?: number
    _count?: OptionsCountAggregateInputType | true
    _avg?: OptionsAvgAggregateInputType
    _sum?: OptionsSumAggregateInputType
    _min?: OptionsMinAggregateInputType
    _max?: OptionsMaxAggregateInputType
  }

  export type OptionsGroupByOutputType = {
    id: number
    group: string
    key: string
    value: string
    is_serialize: boolean
    _count: OptionsCountAggregateOutputType | null
    _avg: OptionsAvgAggregateOutputType | null
    _sum: OptionsSumAggregateOutputType | null
    _min: OptionsMinAggregateOutputType | null
    _max: OptionsMaxAggregateOutputType | null
  }

  type GetOptionsGroupByPayload<T extends optionsGroupByArgs> = Prisma.PrismaPromise<
    Array<
      PickEnumerable<OptionsGroupByOutputType, T['by']> &
        {
          [P in ((keyof T) & (keyof OptionsGroupByOutputType))]: P extends '_count'
            ? T[P] extends boolean
              ? number
              : GetScalarType<T[P], OptionsGroupByOutputType[P]>
            : GetScalarType<T[P], OptionsGroupByOutputType[P]>
        }
      >
    >


  export type optionsSelect<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = $Extensions.GetSelect<{
    id?: boolean
    group?: boolean
    key?: boolean
    value?: boolean
    is_serialize?: boolean
  }, ExtArgs["result"]["options"]>

  export type optionsSelectCreateManyAndReturn<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = $Extensions.GetSelect<{
    id?: boolean
    group?: boolean
    key?: boolean
    value?: boolean
    is_serialize?: boolean
  }, ExtArgs["result"]["options"]>

  export type optionsSelectScalar = {
    id?: boolean
    group?: boolean
    key?: boolean
    value?: boolean
    is_serialize?: boolean
  }


  export type $optionsPayload<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    name: "options"
    objects: {}
    scalars: $Extensions.GetPayloadResult<{
      id: number
      group: string
      key: string
      value: string
      is_serialize: boolean
    }, ExtArgs["result"]["options"]>
    composites: {}
  }

  type optionsGetPayload<S extends boolean | null | undefined | optionsDefaultArgs> = $Result.GetResult<Prisma.$optionsPayload, S>

  type optionsCountArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = 
    Omit<optionsFindManyArgs, 'select' | 'include' | 'distinct'> & {
      select?: OptionsCountAggregateInputType | true
    }

  export interface optionsDelegate<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> {
    [K: symbol]: { types: Prisma.TypeMap<ExtArgs>['model']['options'], meta: { name: 'options' } }
    /**
     * Find zero or one Options that matches the filter.
     * @param {optionsFindUniqueArgs} args - Arguments to find a Options
     * @example
     * // Get one Options
     * const options = await prisma.options.findUnique({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findUnique<T extends optionsFindUniqueArgs>(args: SelectSubset<T, optionsFindUniqueArgs<ExtArgs>>): Prisma__optionsClient<$Result.GetResult<Prisma.$optionsPayload<ExtArgs>, T, "findUnique"> | null, null, ExtArgs>

    /**
     * Find one Options that matches the filter or throw an error with `error.code='P2025'` 
     * if no matches were found.
     * @param {optionsFindUniqueOrThrowArgs} args - Arguments to find a Options
     * @example
     * // Get one Options
     * const options = await prisma.options.findUniqueOrThrow({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findUniqueOrThrow<T extends optionsFindUniqueOrThrowArgs>(args: SelectSubset<T, optionsFindUniqueOrThrowArgs<ExtArgs>>): Prisma__optionsClient<$Result.GetResult<Prisma.$optionsPayload<ExtArgs>, T, "findUniqueOrThrow">, never, ExtArgs>

    /**
     * Find the first Options that matches the filter.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {optionsFindFirstArgs} args - Arguments to find a Options
     * @example
     * // Get one Options
     * const options = await prisma.options.findFirst({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findFirst<T extends optionsFindFirstArgs>(args?: SelectSubset<T, optionsFindFirstArgs<ExtArgs>>): Prisma__optionsClient<$Result.GetResult<Prisma.$optionsPayload<ExtArgs>, T, "findFirst"> | null, null, ExtArgs>

    /**
     * Find the first Options that matches the filter or
     * throw `PrismaKnownClientError` with `P2025` code if no matches were found.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {optionsFindFirstOrThrowArgs} args - Arguments to find a Options
     * @example
     * // Get one Options
     * const options = await prisma.options.findFirstOrThrow({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findFirstOrThrow<T extends optionsFindFirstOrThrowArgs>(args?: SelectSubset<T, optionsFindFirstOrThrowArgs<ExtArgs>>): Prisma__optionsClient<$Result.GetResult<Prisma.$optionsPayload<ExtArgs>, T, "findFirstOrThrow">, never, ExtArgs>

    /**
     * Find zero or more Options that matches the filter.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {optionsFindManyArgs} args - Arguments to filter and select certain fields only.
     * @example
     * // Get all Options
     * const options = await prisma.options.findMany()
     * 
     * // Get first 10 Options
     * const options = await prisma.options.findMany({ take: 10 })
     * 
     * // Only select the `id`
     * const optionsWithIdOnly = await prisma.options.findMany({ select: { id: true } })
     * 
     */
    findMany<T extends optionsFindManyArgs>(args?: SelectSubset<T, optionsFindManyArgs<ExtArgs>>): Prisma.PrismaPromise<$Result.GetResult<Prisma.$optionsPayload<ExtArgs>, T, "findMany">>

    /**
     * Create a Options.
     * @param {optionsCreateArgs} args - Arguments to create a Options.
     * @example
     * // Create one Options
     * const Options = await prisma.options.create({
     *   data: {
     *     // ... data to create a Options
     *   }
     * })
     * 
     */
    create<T extends optionsCreateArgs>(args: SelectSubset<T, optionsCreateArgs<ExtArgs>>): Prisma__optionsClient<$Result.GetResult<Prisma.$optionsPayload<ExtArgs>, T, "create">, never, ExtArgs>

    /**
     * Create many Options.
     * @param {optionsCreateManyArgs} args - Arguments to create many Options.
     * @example
     * // Create many Options
     * const options = await prisma.options.createMany({
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     *     
     */
    createMany<T extends optionsCreateManyArgs>(args?: SelectSubset<T, optionsCreateManyArgs<ExtArgs>>): Prisma.PrismaPromise<BatchPayload>

    /**
     * Create many Options and returns the data saved in the database.
     * @param {optionsCreateManyAndReturnArgs} args - Arguments to create many Options.
     * @example
     * // Create many Options
     * const options = await prisma.options.createManyAndReturn({
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     * 
     * // Create many Options and only return the `id`
     * const optionsWithIdOnly = await prisma.options.createManyAndReturn({ 
     *   select: { id: true },
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * 
     */
    createManyAndReturn<T extends optionsCreateManyAndReturnArgs>(args?: SelectSubset<T, optionsCreateManyAndReturnArgs<ExtArgs>>): Prisma.PrismaPromise<$Result.GetResult<Prisma.$optionsPayload<ExtArgs>, T, "createManyAndReturn">>

    /**
     * Delete a Options.
     * @param {optionsDeleteArgs} args - Arguments to delete one Options.
     * @example
     * // Delete one Options
     * const Options = await prisma.options.delete({
     *   where: {
     *     // ... filter to delete one Options
     *   }
     * })
     * 
     */
    delete<T extends optionsDeleteArgs>(args: SelectSubset<T, optionsDeleteArgs<ExtArgs>>): Prisma__optionsClient<$Result.GetResult<Prisma.$optionsPayload<ExtArgs>, T, "delete">, never, ExtArgs>

    /**
     * Update one Options.
     * @param {optionsUpdateArgs} args - Arguments to update one Options.
     * @example
     * // Update one Options
     * const options = await prisma.options.update({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: {
     *     // ... provide data here
     *   }
     * })
     * 
     */
    update<T extends optionsUpdateArgs>(args: SelectSubset<T, optionsUpdateArgs<ExtArgs>>): Prisma__optionsClient<$Result.GetResult<Prisma.$optionsPayload<ExtArgs>, T, "update">, never, ExtArgs>

    /**
     * Delete zero or more Options.
     * @param {optionsDeleteManyArgs} args - Arguments to filter Options to delete.
     * @example
     * // Delete a few Options
     * const { count } = await prisma.options.deleteMany({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     * 
     */
    deleteMany<T extends optionsDeleteManyArgs>(args?: SelectSubset<T, optionsDeleteManyArgs<ExtArgs>>): Prisma.PrismaPromise<BatchPayload>

    /**
     * Update zero or more Options.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {optionsUpdateManyArgs} args - Arguments to update one or more rows.
     * @example
     * // Update many Options
     * const options = await prisma.options.updateMany({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: {
     *     // ... provide data here
     *   }
     * })
     * 
     */
    updateMany<T extends optionsUpdateManyArgs>(args: SelectSubset<T, optionsUpdateManyArgs<ExtArgs>>): Prisma.PrismaPromise<BatchPayload>

    /**
     * Create or update one Options.
     * @param {optionsUpsertArgs} args - Arguments to update or create a Options.
     * @example
     * // Update or create a Options
     * const options = await prisma.options.upsert({
     *   create: {
     *     // ... data to create a Options
     *   },
     *   update: {
     *     // ... in case it already exists, update
     *   },
     *   where: {
     *     // ... the filter for the Options we want to update
     *   }
     * })
     */
    upsert<T extends optionsUpsertArgs>(args: SelectSubset<T, optionsUpsertArgs<ExtArgs>>): Prisma__optionsClient<$Result.GetResult<Prisma.$optionsPayload<ExtArgs>, T, "upsert">, never, ExtArgs>


    /**
     * Count the number of Options.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {optionsCountArgs} args - Arguments to filter Options to count.
     * @example
     * // Count the number of Options
     * const count = await prisma.options.count({
     *   where: {
     *     // ... the filter for the Options we want to count
     *   }
     * })
    **/
    count<T extends optionsCountArgs>(
      args?: Subset<T, optionsCountArgs>,
    ): Prisma.PrismaPromise<
      T extends $Utils.Record<'select', any>
        ? T['select'] extends true
          ? number
          : GetScalarType<T['select'], OptionsCountAggregateOutputType>
        : number
    >

    /**
     * Allows you to perform aggregations operations on a Options.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {OptionsAggregateArgs} args - Select which aggregations you would like to apply and on what fields.
     * @example
     * // Ordered by age ascending
     * // Where email contains prisma.io
     * // Limited to the 10 users
     * const aggregations = await prisma.user.aggregate({
     *   _avg: {
     *     age: true,
     *   },
     *   where: {
     *     email: {
     *       contains: "prisma.io",
     *     },
     *   },
     *   orderBy: {
     *     age: "asc",
     *   },
     *   take: 10,
     * })
    **/
    aggregate<T extends OptionsAggregateArgs>(args: Subset<T, OptionsAggregateArgs>): Prisma.PrismaPromise<GetOptionsAggregateType<T>>

    /**
     * Group by Options.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {optionsGroupByArgs} args - Group by arguments.
     * @example
     * // Group by city, order by createdAt, get count
     * const result = await prisma.user.groupBy({
     *   by: ['city', 'createdAt'],
     *   orderBy: {
     *     createdAt: true
     *   },
     *   _count: {
     *     _all: true
     *   },
     * })
     * 
    **/
    groupBy<
      T extends optionsGroupByArgs,
      HasSelectOrTake extends Or<
        Extends<'skip', Keys<T>>,
        Extends<'take', Keys<T>>
      >,
      OrderByArg extends True extends HasSelectOrTake
        ? { orderBy: optionsGroupByArgs['orderBy'] }
        : { orderBy?: optionsGroupByArgs['orderBy'] },
      OrderFields extends ExcludeUnderscoreKeys<Keys<MaybeTupleToUnion<T['orderBy']>>>,
      ByFields extends MaybeTupleToUnion<T['by']>,
      ByValid extends Has<ByFields, OrderFields>,
      HavingFields extends GetHavingFields<T['having']>,
      HavingValid extends Has<ByFields, HavingFields>,
      ByEmpty extends T['by'] extends never[] ? True : False,
      InputErrors extends ByEmpty extends True
      ? `Error: "by" must not be empty.`
      : HavingValid extends False
      ? {
          [P in HavingFields]: P extends ByFields
            ? never
            : P extends string
            ? `Error: Field "${P}" used in "having" needs to be provided in "by".`
            : [
                Error,
                'Field ',
                P,
                ` in "having" needs to be provided in "by"`,
              ]
        }[HavingFields]
      : 'take' extends Keys<T>
      ? 'orderBy' extends Keys<T>
        ? ByValid extends True
          ? {}
          : {
              [P in OrderFields]: P extends ByFields
                ? never
                : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
            }[OrderFields]
        : 'Error: If you provide "take", you also need to provide "orderBy"'
      : 'skip' extends Keys<T>
      ? 'orderBy' extends Keys<T>
        ? ByValid extends True
          ? {}
          : {
              [P in OrderFields]: P extends ByFields
                ? never
                : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
            }[OrderFields]
        : 'Error: If you provide "skip", you also need to provide "orderBy"'
      : ByValid extends True
      ? {}
      : {
          [P in OrderFields]: P extends ByFields
            ? never
            : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
        }[OrderFields]
    >(args: SubsetIntersection<T, optionsGroupByArgs, OrderByArg> & InputErrors): {} extends InputErrors ? GetOptionsGroupByPayload<T> : Prisma.PrismaPromise<InputErrors>
  /**
   * Fields of the options model
   */
  readonly fields: optionsFieldRefs;
  }

  /**
   * The delegate class that acts as a "Promise-like" for options.
   * Why is this prefixed with `Prisma__`?
   * Because we want to prevent naming conflicts as mentioned in
   * https://github.com/prisma/prisma-client-js/issues/707
   */
  export interface Prisma__optionsClient<T, Null = never, ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> extends Prisma.PrismaPromise<T> {
    readonly [Symbol.toStringTag]: "PrismaPromise"
    /**
     * Attaches callbacks for the resolution and/or rejection of the Promise.
     * @param onfulfilled The callback to execute when the Promise is resolved.
     * @param onrejected The callback to execute when the Promise is rejected.
     * @returns A Promise for the completion of which ever callback is executed.
     */
    then<TResult1 = T, TResult2 = never>(onfulfilled?: ((value: T) => TResult1 | PromiseLike<TResult1>) | undefined | null, onrejected?: ((reason: any) => TResult2 | PromiseLike<TResult2>) | undefined | null): $Utils.JsPromise<TResult1 | TResult2>
    /**
     * Attaches a callback for only the rejection of the Promise.
     * @param onrejected The callback to execute when the Promise is rejected.
     * @returns A Promise for the completion of the callback.
     */
    catch<TResult = never>(onrejected?: ((reason: any) => TResult | PromiseLike<TResult>) | undefined | null): $Utils.JsPromise<T | TResult>
    /**
     * Attaches a callback that is invoked when the Promise is settled (fulfilled or rejected). The
     * resolved value cannot be modified from the callback.
     * @param onfinally The callback to execute when the Promise is settled (fulfilled or rejected).
     * @returns A Promise for the completion of the callback.
     */
    finally(onfinally?: (() => void) | undefined | null): $Utils.JsPromise<T>
  }




  /**
   * Fields of the options model
   */ 
  interface optionsFieldRefs {
    readonly id: FieldRef<"options", 'Int'>
    readonly group: FieldRef<"options", 'String'>
    readonly key: FieldRef<"options", 'String'>
    readonly value: FieldRef<"options", 'String'>
    readonly is_serialize: FieldRef<"options", 'Boolean'>
  }
    

  // Custom InputTypes
  /**
   * options findUnique
   */
  export type optionsFindUniqueArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the options
     */
    select?: optionsSelect<ExtArgs> | null
    /**
     * Filter, which options to fetch.
     */
    where: optionsWhereUniqueInput
  }

  /**
   * options findUniqueOrThrow
   */
  export type optionsFindUniqueOrThrowArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the options
     */
    select?: optionsSelect<ExtArgs> | null
    /**
     * Filter, which options to fetch.
     */
    where: optionsWhereUniqueInput
  }

  /**
   * options findFirst
   */
  export type optionsFindFirstArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the options
     */
    select?: optionsSelect<ExtArgs> | null
    /**
     * Filter, which options to fetch.
     */
    where?: optionsWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of options to fetch.
     */
    orderBy?: optionsOrderByWithRelationInput | optionsOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for searching for options.
     */
    cursor?: optionsWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` options from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` options.
     */
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/distinct Distinct Docs}
     * 
     * Filter by unique combinations of options.
     */
    distinct?: OptionsScalarFieldEnum | OptionsScalarFieldEnum[]
  }

  /**
   * options findFirstOrThrow
   */
  export type optionsFindFirstOrThrowArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the options
     */
    select?: optionsSelect<ExtArgs> | null
    /**
     * Filter, which options to fetch.
     */
    where?: optionsWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of options to fetch.
     */
    orderBy?: optionsOrderByWithRelationInput | optionsOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for searching for options.
     */
    cursor?: optionsWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` options from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` options.
     */
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/distinct Distinct Docs}
     * 
     * Filter by unique combinations of options.
     */
    distinct?: OptionsScalarFieldEnum | OptionsScalarFieldEnum[]
  }

  /**
   * options findMany
   */
  export type optionsFindManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the options
     */
    select?: optionsSelect<ExtArgs> | null
    /**
     * Filter, which options to fetch.
     */
    where?: optionsWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of options to fetch.
     */
    orderBy?: optionsOrderByWithRelationInput | optionsOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for listing options.
     */
    cursor?: optionsWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` options from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` options.
     */
    skip?: number
    distinct?: OptionsScalarFieldEnum | OptionsScalarFieldEnum[]
  }

  /**
   * options create
   */
  export type optionsCreateArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the options
     */
    select?: optionsSelect<ExtArgs> | null
    /**
     * The data needed to create a options.
     */
    data: XOR<optionsCreateInput, optionsUncheckedCreateInput>
  }

  /**
   * options createMany
   */
  export type optionsCreateManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * The data used to create many options.
     */
    data: optionsCreateManyInput | optionsCreateManyInput[]
  }

  /**
   * options createManyAndReturn
   */
  export type optionsCreateManyAndReturnArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the options
     */
    select?: optionsSelectCreateManyAndReturn<ExtArgs> | null
    /**
     * The data used to create many options.
     */
    data: optionsCreateManyInput | optionsCreateManyInput[]
  }

  /**
   * options update
   */
  export type optionsUpdateArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the options
     */
    select?: optionsSelect<ExtArgs> | null
    /**
     * The data needed to update a options.
     */
    data: XOR<optionsUpdateInput, optionsUncheckedUpdateInput>
    /**
     * Choose, which options to update.
     */
    where: optionsWhereUniqueInput
  }

  /**
   * options updateMany
   */
  export type optionsUpdateManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * The data used to update options.
     */
    data: XOR<optionsUpdateManyMutationInput, optionsUncheckedUpdateManyInput>
    /**
     * Filter which options to update
     */
    where?: optionsWhereInput
  }

  /**
   * options upsert
   */
  export type optionsUpsertArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the options
     */
    select?: optionsSelect<ExtArgs> | null
    /**
     * The filter to search for the options to update in case it exists.
     */
    where: optionsWhereUniqueInput
    /**
     * In case the options found by the `where` argument doesn't exist, create a new options with this data.
     */
    create: XOR<optionsCreateInput, optionsUncheckedCreateInput>
    /**
     * In case the options was found with the provided `where` argument, update it with this data.
     */
    update: XOR<optionsUpdateInput, optionsUncheckedUpdateInput>
  }

  /**
   * options delete
   */
  export type optionsDeleteArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the options
     */
    select?: optionsSelect<ExtArgs> | null
    /**
     * Filter which options to delete.
     */
    where: optionsWhereUniqueInput
  }

  /**
   * options deleteMany
   */
  export type optionsDeleteManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Filter which options to delete
     */
    where?: optionsWhereInput
  }

  /**
   * options without action
   */
  export type optionsDefaultArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the options
     */
    select?: optionsSelect<ExtArgs> | null
  }


  /**
   * Model devices
   */

  export type AggregateDevices = {
    _count: DevicesCountAggregateOutputType | null
    _avg: DevicesAvgAggregateOutputType | null
    _sum: DevicesSumAggregateOutputType | null
    _min: DevicesMinAggregateOutputType | null
    _max: DevicesMaxAggregateOutputType | null
  }

  export type DevicesAvgAggregateOutputType = {
    id: number | null
  }

  export type DevicesSumAggregateOutputType = {
    id: number | null
  }

  export type DevicesMinAggregateOutputType = {
    id: number | null
    name: string | null
    phone: string | null
    description: string | null
    is_default: boolean | null
    ip: string | null
  }

  export type DevicesMaxAggregateOutputType = {
    id: number | null
    name: string | null
    phone: string | null
    description: string | null
    is_default: boolean | null
    ip: string | null
  }

  export type DevicesCountAggregateOutputType = {
    id: number
    name: number
    phone: number
    description: number
    is_default: number
    ip: number
    _all: number
  }


  export type DevicesAvgAggregateInputType = {
    id?: true
  }

  export type DevicesSumAggregateInputType = {
    id?: true
  }

  export type DevicesMinAggregateInputType = {
    id?: true
    name?: true
    phone?: true
    description?: true
    is_default?: true
    ip?: true
  }

  export type DevicesMaxAggregateInputType = {
    id?: true
    name?: true
    phone?: true
    description?: true
    is_default?: true
    ip?: true
  }

  export type DevicesCountAggregateInputType = {
    id?: true
    name?: true
    phone?: true
    description?: true
    is_default?: true
    ip?: true
    _all?: true
  }

  export type DevicesAggregateArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Filter which devices to aggregate.
     */
    where?: devicesWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of devices to fetch.
     */
    orderBy?: devicesOrderByWithRelationInput | devicesOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the start position
     */
    cursor?: devicesWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` devices from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` devices.
     */
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Count returned devices
    **/
    _count?: true | DevicesCountAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to average
    **/
    _avg?: DevicesAvgAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to sum
    **/
    _sum?: DevicesSumAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to find the minimum value
    **/
    _min?: DevicesMinAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to find the maximum value
    **/
    _max?: DevicesMaxAggregateInputType
  }

  export type GetDevicesAggregateType<T extends DevicesAggregateArgs> = {
        [P in keyof T & keyof AggregateDevices]: P extends '_count' | 'count'
      ? T[P] extends true
        ? number
        : GetScalarType<T[P], AggregateDevices[P]>
      : GetScalarType<T[P], AggregateDevices[P]>
  }




  export type devicesGroupByArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    where?: devicesWhereInput
    orderBy?: devicesOrderByWithAggregationInput | devicesOrderByWithAggregationInput[]
    by: DevicesScalarFieldEnum[] | DevicesScalarFieldEnum
    having?: devicesScalarWhereWithAggregatesInput
    take?: number
    skip?: number
    _count?: DevicesCountAggregateInputType | true
    _avg?: DevicesAvgAggregateInputType
    _sum?: DevicesSumAggregateInputType
    _min?: DevicesMinAggregateInputType
    _max?: DevicesMaxAggregateInputType
  }

  export type DevicesGroupByOutputType = {
    id: number
    name: string
    phone: string
    description: string
    is_default: boolean
    ip: string
    _count: DevicesCountAggregateOutputType | null
    _avg: DevicesAvgAggregateOutputType | null
    _sum: DevicesSumAggregateOutputType | null
    _min: DevicesMinAggregateOutputType | null
    _max: DevicesMaxAggregateOutputType | null
  }

  type GetDevicesGroupByPayload<T extends devicesGroupByArgs> = Prisma.PrismaPromise<
    Array<
      PickEnumerable<DevicesGroupByOutputType, T['by']> &
        {
          [P in ((keyof T) & (keyof DevicesGroupByOutputType))]: P extends '_count'
            ? T[P] extends boolean
              ? number
              : GetScalarType<T[P], DevicesGroupByOutputType[P]>
            : GetScalarType<T[P], DevicesGroupByOutputType[P]>
        }
      >
    >


  export type devicesSelect<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = $Extensions.GetSelect<{
    id?: boolean
    name?: boolean
    phone?: boolean
    description?: boolean
    is_default?: boolean
    ip?: boolean
  }, ExtArgs["result"]["devices"]>

  export type devicesSelectCreateManyAndReturn<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = $Extensions.GetSelect<{
    id?: boolean
    name?: boolean
    phone?: boolean
    description?: boolean
    is_default?: boolean
    ip?: boolean
  }, ExtArgs["result"]["devices"]>

  export type devicesSelectScalar = {
    id?: boolean
    name?: boolean
    phone?: boolean
    description?: boolean
    is_default?: boolean
    ip?: boolean
  }


  export type $devicesPayload<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    name: "devices"
    objects: {}
    scalars: $Extensions.GetPayloadResult<{
      id: number
      name: string
      phone: string
      description: string
      is_default: boolean
      ip: string
    }, ExtArgs["result"]["devices"]>
    composites: {}
  }

  type devicesGetPayload<S extends boolean | null | undefined | devicesDefaultArgs> = $Result.GetResult<Prisma.$devicesPayload, S>

  type devicesCountArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = 
    Omit<devicesFindManyArgs, 'select' | 'include' | 'distinct'> & {
      select?: DevicesCountAggregateInputType | true
    }

  export interface devicesDelegate<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> {
    [K: symbol]: { types: Prisma.TypeMap<ExtArgs>['model']['devices'], meta: { name: 'devices' } }
    /**
     * Find zero or one Devices that matches the filter.
     * @param {devicesFindUniqueArgs} args - Arguments to find a Devices
     * @example
     * // Get one Devices
     * const devices = await prisma.devices.findUnique({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findUnique<T extends devicesFindUniqueArgs>(args: SelectSubset<T, devicesFindUniqueArgs<ExtArgs>>): Prisma__devicesClient<$Result.GetResult<Prisma.$devicesPayload<ExtArgs>, T, "findUnique"> | null, null, ExtArgs>

    /**
     * Find one Devices that matches the filter or throw an error with `error.code='P2025'` 
     * if no matches were found.
     * @param {devicesFindUniqueOrThrowArgs} args - Arguments to find a Devices
     * @example
     * // Get one Devices
     * const devices = await prisma.devices.findUniqueOrThrow({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findUniqueOrThrow<T extends devicesFindUniqueOrThrowArgs>(args: SelectSubset<T, devicesFindUniqueOrThrowArgs<ExtArgs>>): Prisma__devicesClient<$Result.GetResult<Prisma.$devicesPayload<ExtArgs>, T, "findUniqueOrThrow">, never, ExtArgs>

    /**
     * Find the first Devices that matches the filter.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {devicesFindFirstArgs} args - Arguments to find a Devices
     * @example
     * // Get one Devices
     * const devices = await prisma.devices.findFirst({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findFirst<T extends devicesFindFirstArgs>(args?: SelectSubset<T, devicesFindFirstArgs<ExtArgs>>): Prisma__devicesClient<$Result.GetResult<Prisma.$devicesPayload<ExtArgs>, T, "findFirst"> | null, null, ExtArgs>

    /**
     * Find the first Devices that matches the filter or
     * throw `PrismaKnownClientError` with `P2025` code if no matches were found.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {devicesFindFirstOrThrowArgs} args - Arguments to find a Devices
     * @example
     * // Get one Devices
     * const devices = await prisma.devices.findFirstOrThrow({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findFirstOrThrow<T extends devicesFindFirstOrThrowArgs>(args?: SelectSubset<T, devicesFindFirstOrThrowArgs<ExtArgs>>): Prisma__devicesClient<$Result.GetResult<Prisma.$devicesPayload<ExtArgs>, T, "findFirstOrThrow">, never, ExtArgs>

    /**
     * Find zero or more Devices that matches the filter.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {devicesFindManyArgs} args - Arguments to filter and select certain fields only.
     * @example
     * // Get all Devices
     * const devices = await prisma.devices.findMany()
     * 
     * // Get first 10 Devices
     * const devices = await prisma.devices.findMany({ take: 10 })
     * 
     * // Only select the `id`
     * const devicesWithIdOnly = await prisma.devices.findMany({ select: { id: true } })
     * 
     */
    findMany<T extends devicesFindManyArgs>(args?: SelectSubset<T, devicesFindManyArgs<ExtArgs>>): Prisma.PrismaPromise<$Result.GetResult<Prisma.$devicesPayload<ExtArgs>, T, "findMany">>

    /**
     * Create a Devices.
     * @param {devicesCreateArgs} args - Arguments to create a Devices.
     * @example
     * // Create one Devices
     * const Devices = await prisma.devices.create({
     *   data: {
     *     // ... data to create a Devices
     *   }
     * })
     * 
     */
    create<T extends devicesCreateArgs>(args: SelectSubset<T, devicesCreateArgs<ExtArgs>>): Prisma__devicesClient<$Result.GetResult<Prisma.$devicesPayload<ExtArgs>, T, "create">, never, ExtArgs>

    /**
     * Create many Devices.
     * @param {devicesCreateManyArgs} args - Arguments to create many Devices.
     * @example
     * // Create many Devices
     * const devices = await prisma.devices.createMany({
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     *     
     */
    createMany<T extends devicesCreateManyArgs>(args?: SelectSubset<T, devicesCreateManyArgs<ExtArgs>>): Prisma.PrismaPromise<BatchPayload>

    /**
     * Create many Devices and returns the data saved in the database.
     * @param {devicesCreateManyAndReturnArgs} args - Arguments to create many Devices.
     * @example
     * // Create many Devices
     * const devices = await prisma.devices.createManyAndReturn({
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     * 
     * // Create many Devices and only return the `id`
     * const devicesWithIdOnly = await prisma.devices.createManyAndReturn({ 
     *   select: { id: true },
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * 
     */
    createManyAndReturn<T extends devicesCreateManyAndReturnArgs>(args?: SelectSubset<T, devicesCreateManyAndReturnArgs<ExtArgs>>): Prisma.PrismaPromise<$Result.GetResult<Prisma.$devicesPayload<ExtArgs>, T, "createManyAndReturn">>

    /**
     * Delete a Devices.
     * @param {devicesDeleteArgs} args - Arguments to delete one Devices.
     * @example
     * // Delete one Devices
     * const Devices = await prisma.devices.delete({
     *   where: {
     *     // ... filter to delete one Devices
     *   }
     * })
     * 
     */
    delete<T extends devicesDeleteArgs>(args: SelectSubset<T, devicesDeleteArgs<ExtArgs>>): Prisma__devicesClient<$Result.GetResult<Prisma.$devicesPayload<ExtArgs>, T, "delete">, never, ExtArgs>

    /**
     * Update one Devices.
     * @param {devicesUpdateArgs} args - Arguments to update one Devices.
     * @example
     * // Update one Devices
     * const devices = await prisma.devices.update({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: {
     *     // ... provide data here
     *   }
     * })
     * 
     */
    update<T extends devicesUpdateArgs>(args: SelectSubset<T, devicesUpdateArgs<ExtArgs>>): Prisma__devicesClient<$Result.GetResult<Prisma.$devicesPayload<ExtArgs>, T, "update">, never, ExtArgs>

    /**
     * Delete zero or more Devices.
     * @param {devicesDeleteManyArgs} args - Arguments to filter Devices to delete.
     * @example
     * // Delete a few Devices
     * const { count } = await prisma.devices.deleteMany({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     * 
     */
    deleteMany<T extends devicesDeleteManyArgs>(args?: SelectSubset<T, devicesDeleteManyArgs<ExtArgs>>): Prisma.PrismaPromise<BatchPayload>

    /**
     * Update zero or more Devices.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {devicesUpdateManyArgs} args - Arguments to update one or more rows.
     * @example
     * // Update many Devices
     * const devices = await prisma.devices.updateMany({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: {
     *     // ... provide data here
     *   }
     * })
     * 
     */
    updateMany<T extends devicesUpdateManyArgs>(args: SelectSubset<T, devicesUpdateManyArgs<ExtArgs>>): Prisma.PrismaPromise<BatchPayload>

    /**
     * Create or update one Devices.
     * @param {devicesUpsertArgs} args - Arguments to update or create a Devices.
     * @example
     * // Update or create a Devices
     * const devices = await prisma.devices.upsert({
     *   create: {
     *     // ... data to create a Devices
     *   },
     *   update: {
     *     // ... in case it already exists, update
     *   },
     *   where: {
     *     // ... the filter for the Devices we want to update
     *   }
     * })
     */
    upsert<T extends devicesUpsertArgs>(args: SelectSubset<T, devicesUpsertArgs<ExtArgs>>): Prisma__devicesClient<$Result.GetResult<Prisma.$devicesPayload<ExtArgs>, T, "upsert">, never, ExtArgs>


    /**
     * Count the number of Devices.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {devicesCountArgs} args - Arguments to filter Devices to count.
     * @example
     * // Count the number of Devices
     * const count = await prisma.devices.count({
     *   where: {
     *     // ... the filter for the Devices we want to count
     *   }
     * })
    **/
    count<T extends devicesCountArgs>(
      args?: Subset<T, devicesCountArgs>,
    ): Prisma.PrismaPromise<
      T extends $Utils.Record<'select', any>
        ? T['select'] extends true
          ? number
          : GetScalarType<T['select'], DevicesCountAggregateOutputType>
        : number
    >

    /**
     * Allows you to perform aggregations operations on a Devices.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {DevicesAggregateArgs} args - Select which aggregations you would like to apply and on what fields.
     * @example
     * // Ordered by age ascending
     * // Where email contains prisma.io
     * // Limited to the 10 users
     * const aggregations = await prisma.user.aggregate({
     *   _avg: {
     *     age: true,
     *   },
     *   where: {
     *     email: {
     *       contains: "prisma.io",
     *     },
     *   },
     *   orderBy: {
     *     age: "asc",
     *   },
     *   take: 10,
     * })
    **/
    aggregate<T extends DevicesAggregateArgs>(args: Subset<T, DevicesAggregateArgs>): Prisma.PrismaPromise<GetDevicesAggregateType<T>>

    /**
     * Group by Devices.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {devicesGroupByArgs} args - Group by arguments.
     * @example
     * // Group by city, order by createdAt, get count
     * const result = await prisma.user.groupBy({
     *   by: ['city', 'createdAt'],
     *   orderBy: {
     *     createdAt: true
     *   },
     *   _count: {
     *     _all: true
     *   },
     * })
     * 
    **/
    groupBy<
      T extends devicesGroupByArgs,
      HasSelectOrTake extends Or<
        Extends<'skip', Keys<T>>,
        Extends<'take', Keys<T>>
      >,
      OrderByArg extends True extends HasSelectOrTake
        ? { orderBy: devicesGroupByArgs['orderBy'] }
        : { orderBy?: devicesGroupByArgs['orderBy'] },
      OrderFields extends ExcludeUnderscoreKeys<Keys<MaybeTupleToUnion<T['orderBy']>>>,
      ByFields extends MaybeTupleToUnion<T['by']>,
      ByValid extends Has<ByFields, OrderFields>,
      HavingFields extends GetHavingFields<T['having']>,
      HavingValid extends Has<ByFields, HavingFields>,
      ByEmpty extends T['by'] extends never[] ? True : False,
      InputErrors extends ByEmpty extends True
      ? `Error: "by" must not be empty.`
      : HavingValid extends False
      ? {
          [P in HavingFields]: P extends ByFields
            ? never
            : P extends string
            ? `Error: Field "${P}" used in "having" needs to be provided in "by".`
            : [
                Error,
                'Field ',
                P,
                ` in "having" needs to be provided in "by"`,
              ]
        }[HavingFields]
      : 'take' extends Keys<T>
      ? 'orderBy' extends Keys<T>
        ? ByValid extends True
          ? {}
          : {
              [P in OrderFields]: P extends ByFields
                ? never
                : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
            }[OrderFields]
        : 'Error: If you provide "take", you also need to provide "orderBy"'
      : 'skip' extends Keys<T>
      ? 'orderBy' extends Keys<T>
        ? ByValid extends True
          ? {}
          : {
              [P in OrderFields]: P extends ByFields
                ? never
                : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
            }[OrderFields]
        : 'Error: If you provide "skip", you also need to provide "orderBy"'
      : ByValid extends True
      ? {}
      : {
          [P in OrderFields]: P extends ByFields
            ? never
            : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
        }[OrderFields]
    >(args: SubsetIntersection<T, devicesGroupByArgs, OrderByArg> & InputErrors): {} extends InputErrors ? GetDevicesGroupByPayload<T> : Prisma.PrismaPromise<InputErrors>
  /**
   * Fields of the devices model
   */
  readonly fields: devicesFieldRefs;
  }

  /**
   * The delegate class that acts as a "Promise-like" for devices.
   * Why is this prefixed with `Prisma__`?
   * Because we want to prevent naming conflicts as mentioned in
   * https://github.com/prisma/prisma-client-js/issues/707
   */
  export interface Prisma__devicesClient<T, Null = never, ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> extends Prisma.PrismaPromise<T> {
    readonly [Symbol.toStringTag]: "PrismaPromise"
    /**
     * Attaches callbacks for the resolution and/or rejection of the Promise.
     * @param onfulfilled The callback to execute when the Promise is resolved.
     * @param onrejected The callback to execute when the Promise is rejected.
     * @returns A Promise for the completion of which ever callback is executed.
     */
    then<TResult1 = T, TResult2 = never>(onfulfilled?: ((value: T) => TResult1 | PromiseLike<TResult1>) | undefined | null, onrejected?: ((reason: any) => TResult2 | PromiseLike<TResult2>) | undefined | null): $Utils.JsPromise<TResult1 | TResult2>
    /**
     * Attaches a callback for only the rejection of the Promise.
     * @param onrejected The callback to execute when the Promise is rejected.
     * @returns A Promise for the completion of the callback.
     */
    catch<TResult = never>(onrejected?: ((reason: any) => TResult | PromiseLike<TResult>) | undefined | null): $Utils.JsPromise<T | TResult>
    /**
     * Attaches a callback that is invoked when the Promise is settled (fulfilled or rejected). The
     * resolved value cannot be modified from the callback.
     * @param onfinally The callback to execute when the Promise is settled (fulfilled or rejected).
     * @returns A Promise for the completion of the callback.
     */
    finally(onfinally?: (() => void) | undefined | null): $Utils.JsPromise<T>
  }




  /**
   * Fields of the devices model
   */ 
  interface devicesFieldRefs {
    readonly id: FieldRef<"devices", 'Int'>
    readonly name: FieldRef<"devices", 'String'>
    readonly phone: FieldRef<"devices", 'String'>
    readonly description: FieldRef<"devices", 'String'>
    readonly is_default: FieldRef<"devices", 'Boolean'>
    readonly ip: FieldRef<"devices", 'String'>
  }
    

  // Custom InputTypes
  /**
   * devices findUnique
   */
  export type devicesFindUniqueArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the devices
     */
    select?: devicesSelect<ExtArgs> | null
    /**
     * Filter, which devices to fetch.
     */
    where: devicesWhereUniqueInput
  }

  /**
   * devices findUniqueOrThrow
   */
  export type devicesFindUniqueOrThrowArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the devices
     */
    select?: devicesSelect<ExtArgs> | null
    /**
     * Filter, which devices to fetch.
     */
    where: devicesWhereUniqueInput
  }

  /**
   * devices findFirst
   */
  export type devicesFindFirstArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the devices
     */
    select?: devicesSelect<ExtArgs> | null
    /**
     * Filter, which devices to fetch.
     */
    where?: devicesWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of devices to fetch.
     */
    orderBy?: devicesOrderByWithRelationInput | devicesOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for searching for devices.
     */
    cursor?: devicesWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` devices from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` devices.
     */
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/distinct Distinct Docs}
     * 
     * Filter by unique combinations of devices.
     */
    distinct?: DevicesScalarFieldEnum | DevicesScalarFieldEnum[]
  }

  /**
   * devices findFirstOrThrow
   */
  export type devicesFindFirstOrThrowArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the devices
     */
    select?: devicesSelect<ExtArgs> | null
    /**
     * Filter, which devices to fetch.
     */
    where?: devicesWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of devices to fetch.
     */
    orderBy?: devicesOrderByWithRelationInput | devicesOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for searching for devices.
     */
    cursor?: devicesWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` devices from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` devices.
     */
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/distinct Distinct Docs}
     * 
     * Filter by unique combinations of devices.
     */
    distinct?: DevicesScalarFieldEnum | DevicesScalarFieldEnum[]
  }

  /**
   * devices findMany
   */
  export type devicesFindManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the devices
     */
    select?: devicesSelect<ExtArgs> | null
    /**
     * Filter, which devices to fetch.
     */
    where?: devicesWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of devices to fetch.
     */
    orderBy?: devicesOrderByWithRelationInput | devicesOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for listing devices.
     */
    cursor?: devicesWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` devices from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` devices.
     */
    skip?: number
    distinct?: DevicesScalarFieldEnum | DevicesScalarFieldEnum[]
  }

  /**
   * devices create
   */
  export type devicesCreateArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the devices
     */
    select?: devicesSelect<ExtArgs> | null
    /**
     * The data needed to create a devices.
     */
    data: XOR<devicesCreateInput, devicesUncheckedCreateInput>
  }

  /**
   * devices createMany
   */
  export type devicesCreateManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * The data used to create many devices.
     */
    data: devicesCreateManyInput | devicesCreateManyInput[]
  }

  /**
   * devices createManyAndReturn
   */
  export type devicesCreateManyAndReturnArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the devices
     */
    select?: devicesSelectCreateManyAndReturn<ExtArgs> | null
    /**
     * The data used to create many devices.
     */
    data: devicesCreateManyInput | devicesCreateManyInput[]
  }

  /**
   * devices update
   */
  export type devicesUpdateArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the devices
     */
    select?: devicesSelect<ExtArgs> | null
    /**
     * The data needed to update a devices.
     */
    data: XOR<devicesUpdateInput, devicesUncheckedUpdateInput>
    /**
     * Choose, which devices to update.
     */
    where: devicesWhereUniqueInput
  }

  /**
   * devices updateMany
   */
  export type devicesUpdateManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * The data used to update devices.
     */
    data: XOR<devicesUpdateManyMutationInput, devicesUncheckedUpdateManyInput>
    /**
     * Filter which devices to update
     */
    where?: devicesWhereInput
  }

  /**
   * devices upsert
   */
  export type devicesUpsertArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the devices
     */
    select?: devicesSelect<ExtArgs> | null
    /**
     * The filter to search for the devices to update in case it exists.
     */
    where: devicesWhereUniqueInput
    /**
     * In case the devices found by the `where` argument doesn't exist, create a new devices with this data.
     */
    create: XOR<devicesCreateInput, devicesUncheckedCreateInput>
    /**
     * In case the devices was found with the provided `where` argument, update it with this data.
     */
    update: XOR<devicesUpdateInput, devicesUncheckedUpdateInput>
  }

  /**
   * devices delete
   */
  export type devicesDeleteArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the devices
     */
    select?: devicesSelect<ExtArgs> | null
    /**
     * Filter which devices to delete.
     */
    where: devicesWhereUniqueInput
  }

  /**
   * devices deleteMany
   */
  export type devicesDeleteManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Filter which devices to delete
     */
    where?: devicesWhereInput
  }

  /**
   * devices without action
   */
  export type devicesDefaultArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the devices
     */
    select?: devicesSelect<ExtArgs> | null
  }


  /**
   * Model customers
   */

  export type AggregateCustomers = {
    _count: CustomersCountAggregateOutputType | null
    _avg: CustomersAvgAggregateOutputType | null
    _sum: CustomersSumAggregateOutputType | null
    _min: CustomersMinAggregateOutputType | null
    _max: CustomersMaxAggregateOutputType | null
  }

  export type CustomersAvgAggregateOutputType = {
    id: number | null
  }

  export type CustomersSumAggregateOutputType = {
    id: number | null
  }

  export type CustomersMinAggregateOutputType = {
    id: number | null
    firstname: string | null
    lastname: string | null
    phone_number: string | null
    has_call: boolean | null
    has_sms: boolean | null
  }

  export type CustomersMaxAggregateOutputType = {
    id: number | null
    firstname: string | null
    lastname: string | null
    phone_number: string | null
    has_call: boolean | null
    has_sms: boolean | null
  }

  export type CustomersCountAggregateOutputType = {
    id: number
    firstname: number
    lastname: number
    phone_number: number
    has_call: number
    has_sms: number
    _all: number
  }


  export type CustomersAvgAggregateInputType = {
    id?: true
  }

  export type CustomersSumAggregateInputType = {
    id?: true
  }

  export type CustomersMinAggregateInputType = {
    id?: true
    firstname?: true
    lastname?: true
    phone_number?: true
    has_call?: true
    has_sms?: true
  }

  export type CustomersMaxAggregateInputType = {
    id?: true
    firstname?: true
    lastname?: true
    phone_number?: true
    has_call?: true
    has_sms?: true
  }

  export type CustomersCountAggregateInputType = {
    id?: true
    firstname?: true
    lastname?: true
    phone_number?: true
    has_call?: true
    has_sms?: true
    _all?: true
  }

  export type CustomersAggregateArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Filter which customers to aggregate.
     */
    where?: customersWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of customers to fetch.
     */
    orderBy?: customersOrderByWithRelationInput | customersOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the start position
     */
    cursor?: customersWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` customers from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` customers.
     */
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Count returned customers
    **/
    _count?: true | CustomersCountAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to average
    **/
    _avg?: CustomersAvgAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to sum
    **/
    _sum?: CustomersSumAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to find the minimum value
    **/
    _min?: CustomersMinAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to find the maximum value
    **/
    _max?: CustomersMaxAggregateInputType
  }

  export type GetCustomersAggregateType<T extends CustomersAggregateArgs> = {
        [P in keyof T & keyof AggregateCustomers]: P extends '_count' | 'count'
      ? T[P] extends true
        ? number
        : GetScalarType<T[P], AggregateCustomers[P]>
      : GetScalarType<T[P], AggregateCustomers[P]>
  }




  export type customersGroupByArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    where?: customersWhereInput
    orderBy?: customersOrderByWithAggregationInput | customersOrderByWithAggregationInput[]
    by: CustomersScalarFieldEnum[] | CustomersScalarFieldEnum
    having?: customersScalarWhereWithAggregatesInput
    take?: number
    skip?: number
    _count?: CustomersCountAggregateInputType | true
    _avg?: CustomersAvgAggregateInputType
    _sum?: CustomersSumAggregateInputType
    _min?: CustomersMinAggregateInputType
    _max?: CustomersMaxAggregateInputType
  }

  export type CustomersGroupByOutputType = {
    id: number
    firstname: string
    lastname: string
    phone_number: string
    has_call: boolean
    has_sms: boolean
    _count: CustomersCountAggregateOutputType | null
    _avg: CustomersAvgAggregateOutputType | null
    _sum: CustomersSumAggregateOutputType | null
    _min: CustomersMinAggregateOutputType | null
    _max: CustomersMaxAggregateOutputType | null
  }

  type GetCustomersGroupByPayload<T extends customersGroupByArgs> = Prisma.PrismaPromise<
    Array<
      PickEnumerable<CustomersGroupByOutputType, T['by']> &
        {
          [P in ((keyof T) & (keyof CustomersGroupByOutputType))]: P extends '_count'
            ? T[P] extends boolean
              ? number
              : GetScalarType<T[P], CustomersGroupByOutputType[P]>
            : GetScalarType<T[P], CustomersGroupByOutputType[P]>
        }
      >
    >


  export type customersSelect<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = $Extensions.GetSelect<{
    id?: boolean
    firstname?: boolean
    lastname?: boolean
    phone_number?: boolean
    has_call?: boolean
    has_sms?: boolean
  }, ExtArgs["result"]["customers"]>

  export type customersSelectCreateManyAndReturn<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = $Extensions.GetSelect<{
    id?: boolean
    firstname?: boolean
    lastname?: boolean
    phone_number?: boolean
    has_call?: boolean
    has_sms?: boolean
  }, ExtArgs["result"]["customers"]>

  export type customersSelectScalar = {
    id?: boolean
    firstname?: boolean
    lastname?: boolean
    phone_number?: boolean
    has_call?: boolean
    has_sms?: boolean
  }


  export type $customersPayload<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    name: "customers"
    objects: {}
    scalars: $Extensions.GetPayloadResult<{
      id: number
      firstname: string
      lastname: string
      phone_number: string
      has_call: boolean
      has_sms: boolean
    }, ExtArgs["result"]["customers"]>
    composites: {}
  }

  type customersGetPayload<S extends boolean | null | undefined | customersDefaultArgs> = $Result.GetResult<Prisma.$customersPayload, S>

  type customersCountArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = 
    Omit<customersFindManyArgs, 'select' | 'include' | 'distinct'> & {
      select?: CustomersCountAggregateInputType | true
    }

  export interface customersDelegate<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> {
    [K: symbol]: { types: Prisma.TypeMap<ExtArgs>['model']['customers'], meta: { name: 'customers' } }
    /**
     * Find zero or one Customers that matches the filter.
     * @param {customersFindUniqueArgs} args - Arguments to find a Customers
     * @example
     * // Get one Customers
     * const customers = await prisma.customers.findUnique({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findUnique<T extends customersFindUniqueArgs>(args: SelectSubset<T, customersFindUniqueArgs<ExtArgs>>): Prisma__customersClient<$Result.GetResult<Prisma.$customersPayload<ExtArgs>, T, "findUnique"> | null, null, ExtArgs>

    /**
     * Find one Customers that matches the filter or throw an error with `error.code='P2025'` 
     * if no matches were found.
     * @param {customersFindUniqueOrThrowArgs} args - Arguments to find a Customers
     * @example
     * // Get one Customers
     * const customers = await prisma.customers.findUniqueOrThrow({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findUniqueOrThrow<T extends customersFindUniqueOrThrowArgs>(args: SelectSubset<T, customersFindUniqueOrThrowArgs<ExtArgs>>): Prisma__customersClient<$Result.GetResult<Prisma.$customersPayload<ExtArgs>, T, "findUniqueOrThrow">, never, ExtArgs>

    /**
     * Find the first Customers that matches the filter.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {customersFindFirstArgs} args - Arguments to find a Customers
     * @example
     * // Get one Customers
     * const customers = await prisma.customers.findFirst({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findFirst<T extends customersFindFirstArgs>(args?: SelectSubset<T, customersFindFirstArgs<ExtArgs>>): Prisma__customersClient<$Result.GetResult<Prisma.$customersPayload<ExtArgs>, T, "findFirst"> | null, null, ExtArgs>

    /**
     * Find the first Customers that matches the filter or
     * throw `PrismaKnownClientError` with `P2025` code if no matches were found.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {customersFindFirstOrThrowArgs} args - Arguments to find a Customers
     * @example
     * // Get one Customers
     * const customers = await prisma.customers.findFirstOrThrow({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     */
    findFirstOrThrow<T extends customersFindFirstOrThrowArgs>(args?: SelectSubset<T, customersFindFirstOrThrowArgs<ExtArgs>>): Prisma__customersClient<$Result.GetResult<Prisma.$customersPayload<ExtArgs>, T, "findFirstOrThrow">, never, ExtArgs>

    /**
     * Find zero or more Customers that matches the filter.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {customersFindManyArgs} args - Arguments to filter and select certain fields only.
     * @example
     * // Get all Customers
     * const customers = await prisma.customers.findMany()
     * 
     * // Get first 10 Customers
     * const customers = await prisma.customers.findMany({ take: 10 })
     * 
     * // Only select the `id`
     * const customersWithIdOnly = await prisma.customers.findMany({ select: { id: true } })
     * 
     */
    findMany<T extends customersFindManyArgs>(args?: SelectSubset<T, customersFindManyArgs<ExtArgs>>): Prisma.PrismaPromise<$Result.GetResult<Prisma.$customersPayload<ExtArgs>, T, "findMany">>

    /**
     * Create a Customers.
     * @param {customersCreateArgs} args - Arguments to create a Customers.
     * @example
     * // Create one Customers
     * const Customers = await prisma.customers.create({
     *   data: {
     *     // ... data to create a Customers
     *   }
     * })
     * 
     */
    create<T extends customersCreateArgs>(args: SelectSubset<T, customersCreateArgs<ExtArgs>>): Prisma__customersClient<$Result.GetResult<Prisma.$customersPayload<ExtArgs>, T, "create">, never, ExtArgs>

    /**
     * Create many Customers.
     * @param {customersCreateManyArgs} args - Arguments to create many Customers.
     * @example
     * // Create many Customers
     * const customers = await prisma.customers.createMany({
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     *     
     */
    createMany<T extends customersCreateManyArgs>(args?: SelectSubset<T, customersCreateManyArgs<ExtArgs>>): Prisma.PrismaPromise<BatchPayload>

    /**
     * Create many Customers and returns the data saved in the database.
     * @param {customersCreateManyAndReturnArgs} args - Arguments to create many Customers.
     * @example
     * // Create many Customers
     * const customers = await prisma.customers.createManyAndReturn({
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     * 
     * // Create many Customers and only return the `id`
     * const customersWithIdOnly = await prisma.customers.createManyAndReturn({ 
     *   select: { id: true },
     *   data: [
     *     // ... provide data here
     *   ]
     * })
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * 
     */
    createManyAndReturn<T extends customersCreateManyAndReturnArgs>(args?: SelectSubset<T, customersCreateManyAndReturnArgs<ExtArgs>>): Prisma.PrismaPromise<$Result.GetResult<Prisma.$customersPayload<ExtArgs>, T, "createManyAndReturn">>

    /**
     * Delete a Customers.
     * @param {customersDeleteArgs} args - Arguments to delete one Customers.
     * @example
     * // Delete one Customers
     * const Customers = await prisma.customers.delete({
     *   where: {
     *     // ... filter to delete one Customers
     *   }
     * })
     * 
     */
    delete<T extends customersDeleteArgs>(args: SelectSubset<T, customersDeleteArgs<ExtArgs>>): Prisma__customersClient<$Result.GetResult<Prisma.$customersPayload<ExtArgs>, T, "delete">, never, ExtArgs>

    /**
     * Update one Customers.
     * @param {customersUpdateArgs} args - Arguments to update one Customers.
     * @example
     * // Update one Customers
     * const customers = await prisma.customers.update({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: {
     *     // ... provide data here
     *   }
     * })
     * 
     */
    update<T extends customersUpdateArgs>(args: SelectSubset<T, customersUpdateArgs<ExtArgs>>): Prisma__customersClient<$Result.GetResult<Prisma.$customersPayload<ExtArgs>, T, "update">, never, ExtArgs>

    /**
     * Delete zero or more Customers.
     * @param {customersDeleteManyArgs} args - Arguments to filter Customers to delete.
     * @example
     * // Delete a few Customers
     * const { count } = await prisma.customers.deleteMany({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     * 
     */
    deleteMany<T extends customersDeleteManyArgs>(args?: SelectSubset<T, customersDeleteManyArgs<ExtArgs>>): Prisma.PrismaPromise<BatchPayload>

    /**
     * Update zero or more Customers.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {customersUpdateManyArgs} args - Arguments to update one or more rows.
     * @example
     * // Update many Customers
     * const customers = await prisma.customers.updateMany({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: {
     *     // ... provide data here
     *   }
     * })
     * 
     */
    updateMany<T extends customersUpdateManyArgs>(args: SelectSubset<T, customersUpdateManyArgs<ExtArgs>>): Prisma.PrismaPromise<BatchPayload>

    /**
     * Create or update one Customers.
     * @param {customersUpsertArgs} args - Arguments to update or create a Customers.
     * @example
     * // Update or create a Customers
     * const customers = await prisma.customers.upsert({
     *   create: {
     *     // ... data to create a Customers
     *   },
     *   update: {
     *     // ... in case it already exists, update
     *   },
     *   where: {
     *     // ... the filter for the Customers we want to update
     *   }
     * })
     */
    upsert<T extends customersUpsertArgs>(args: SelectSubset<T, customersUpsertArgs<ExtArgs>>): Prisma__customersClient<$Result.GetResult<Prisma.$customersPayload<ExtArgs>, T, "upsert">, never, ExtArgs>


    /**
     * Count the number of Customers.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {customersCountArgs} args - Arguments to filter Customers to count.
     * @example
     * // Count the number of Customers
     * const count = await prisma.customers.count({
     *   where: {
     *     // ... the filter for the Customers we want to count
     *   }
     * })
    **/
    count<T extends customersCountArgs>(
      args?: Subset<T, customersCountArgs>,
    ): Prisma.PrismaPromise<
      T extends $Utils.Record<'select', any>
        ? T['select'] extends true
          ? number
          : GetScalarType<T['select'], CustomersCountAggregateOutputType>
        : number
    >

    /**
     * Allows you to perform aggregations operations on a Customers.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {CustomersAggregateArgs} args - Select which aggregations you would like to apply and on what fields.
     * @example
     * // Ordered by age ascending
     * // Where email contains prisma.io
     * // Limited to the 10 users
     * const aggregations = await prisma.user.aggregate({
     *   _avg: {
     *     age: true,
     *   },
     *   where: {
     *     email: {
     *       contains: "prisma.io",
     *     },
     *   },
     *   orderBy: {
     *     age: "asc",
     *   },
     *   take: 10,
     * })
    **/
    aggregate<T extends CustomersAggregateArgs>(args: Subset<T, CustomersAggregateArgs>): Prisma.PrismaPromise<GetCustomersAggregateType<T>>

    /**
     * Group by Customers.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {customersGroupByArgs} args - Group by arguments.
     * @example
     * // Group by city, order by createdAt, get count
     * const result = await prisma.user.groupBy({
     *   by: ['city', 'createdAt'],
     *   orderBy: {
     *     createdAt: true
     *   },
     *   _count: {
     *     _all: true
     *   },
     * })
     * 
    **/
    groupBy<
      T extends customersGroupByArgs,
      HasSelectOrTake extends Or<
        Extends<'skip', Keys<T>>,
        Extends<'take', Keys<T>>
      >,
      OrderByArg extends True extends HasSelectOrTake
        ? { orderBy: customersGroupByArgs['orderBy'] }
        : { orderBy?: customersGroupByArgs['orderBy'] },
      OrderFields extends ExcludeUnderscoreKeys<Keys<MaybeTupleToUnion<T['orderBy']>>>,
      ByFields extends MaybeTupleToUnion<T['by']>,
      ByValid extends Has<ByFields, OrderFields>,
      HavingFields extends GetHavingFields<T['having']>,
      HavingValid extends Has<ByFields, HavingFields>,
      ByEmpty extends T['by'] extends never[] ? True : False,
      InputErrors extends ByEmpty extends True
      ? `Error: "by" must not be empty.`
      : HavingValid extends False
      ? {
          [P in HavingFields]: P extends ByFields
            ? never
            : P extends string
            ? `Error: Field "${P}" used in "having" needs to be provided in "by".`
            : [
                Error,
                'Field ',
                P,
                ` in "having" needs to be provided in "by"`,
              ]
        }[HavingFields]
      : 'take' extends Keys<T>
      ? 'orderBy' extends Keys<T>
        ? ByValid extends True
          ? {}
          : {
              [P in OrderFields]: P extends ByFields
                ? never
                : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
            }[OrderFields]
        : 'Error: If you provide "take", you also need to provide "orderBy"'
      : 'skip' extends Keys<T>
      ? 'orderBy' extends Keys<T>
        ? ByValid extends True
          ? {}
          : {
              [P in OrderFields]: P extends ByFields
                ? never
                : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
            }[OrderFields]
        : 'Error: If you provide "skip", you also need to provide "orderBy"'
      : ByValid extends True
      ? {}
      : {
          [P in OrderFields]: P extends ByFields
            ? never
            : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
        }[OrderFields]
    >(args: SubsetIntersection<T, customersGroupByArgs, OrderByArg> & InputErrors): {} extends InputErrors ? GetCustomersGroupByPayload<T> : Prisma.PrismaPromise<InputErrors>
  /**
   * Fields of the customers model
   */
  readonly fields: customersFieldRefs;
  }

  /**
   * The delegate class that acts as a "Promise-like" for customers.
   * Why is this prefixed with `Prisma__`?
   * Because we want to prevent naming conflicts as mentioned in
   * https://github.com/prisma/prisma-client-js/issues/707
   */
  export interface Prisma__customersClient<T, Null = never, ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> extends Prisma.PrismaPromise<T> {
    readonly [Symbol.toStringTag]: "PrismaPromise"
    /**
     * Attaches callbacks for the resolution and/or rejection of the Promise.
     * @param onfulfilled The callback to execute when the Promise is resolved.
     * @param onrejected The callback to execute when the Promise is rejected.
     * @returns A Promise for the completion of which ever callback is executed.
     */
    then<TResult1 = T, TResult2 = never>(onfulfilled?: ((value: T) => TResult1 | PromiseLike<TResult1>) | undefined | null, onrejected?: ((reason: any) => TResult2 | PromiseLike<TResult2>) | undefined | null): $Utils.JsPromise<TResult1 | TResult2>
    /**
     * Attaches a callback for only the rejection of the Promise.
     * @param onrejected The callback to execute when the Promise is rejected.
     * @returns A Promise for the completion of the callback.
     */
    catch<TResult = never>(onrejected?: ((reason: any) => TResult | PromiseLike<TResult>) | undefined | null): $Utils.JsPromise<T | TResult>
    /**
     * Attaches a callback that is invoked when the Promise is settled (fulfilled or rejected). The
     * resolved value cannot be modified from the callback.
     * @param onfinally The callback to execute when the Promise is settled (fulfilled or rejected).
     * @returns A Promise for the completion of the callback.
     */
    finally(onfinally?: (() => void) | undefined | null): $Utils.JsPromise<T>
  }




  /**
   * Fields of the customers model
   */ 
  interface customersFieldRefs {
    readonly id: FieldRef<"customers", 'Int'>
    readonly firstname: FieldRef<"customers", 'String'>
    readonly lastname: FieldRef<"customers", 'String'>
    readonly phone_number: FieldRef<"customers", 'String'>
    readonly has_call: FieldRef<"customers", 'Boolean'>
    readonly has_sms: FieldRef<"customers", 'Boolean'>
  }
    

  // Custom InputTypes
  /**
   * customers findUnique
   */
  export type customersFindUniqueArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the customers
     */
    select?: customersSelect<ExtArgs> | null
    /**
     * Filter, which customers to fetch.
     */
    where: customersWhereUniqueInput
  }

  /**
   * customers findUniqueOrThrow
   */
  export type customersFindUniqueOrThrowArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the customers
     */
    select?: customersSelect<ExtArgs> | null
    /**
     * Filter, which customers to fetch.
     */
    where: customersWhereUniqueInput
  }

  /**
   * customers findFirst
   */
  export type customersFindFirstArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the customers
     */
    select?: customersSelect<ExtArgs> | null
    /**
     * Filter, which customers to fetch.
     */
    where?: customersWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of customers to fetch.
     */
    orderBy?: customersOrderByWithRelationInput | customersOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for searching for customers.
     */
    cursor?: customersWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` customers from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` customers.
     */
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/distinct Distinct Docs}
     * 
     * Filter by unique combinations of customers.
     */
    distinct?: CustomersScalarFieldEnum | CustomersScalarFieldEnum[]
  }

  /**
   * customers findFirstOrThrow
   */
  export type customersFindFirstOrThrowArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the customers
     */
    select?: customersSelect<ExtArgs> | null
    /**
     * Filter, which customers to fetch.
     */
    where?: customersWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of customers to fetch.
     */
    orderBy?: customersOrderByWithRelationInput | customersOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for searching for customers.
     */
    cursor?: customersWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` customers from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` customers.
     */
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/distinct Distinct Docs}
     * 
     * Filter by unique combinations of customers.
     */
    distinct?: CustomersScalarFieldEnum | CustomersScalarFieldEnum[]
  }

  /**
   * customers findMany
   */
  export type customersFindManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the customers
     */
    select?: customersSelect<ExtArgs> | null
    /**
     * Filter, which customers to fetch.
     */
    where?: customersWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of customers to fetch.
     */
    orderBy?: customersOrderByWithRelationInput | customersOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for listing customers.
     */
    cursor?: customersWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` customers from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` customers.
     */
    skip?: number
    distinct?: CustomersScalarFieldEnum | CustomersScalarFieldEnum[]
  }

  /**
   * customers create
   */
  export type customersCreateArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the customers
     */
    select?: customersSelect<ExtArgs> | null
    /**
     * The data needed to create a customers.
     */
    data: XOR<customersCreateInput, customersUncheckedCreateInput>
  }

  /**
   * customers createMany
   */
  export type customersCreateManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * The data used to create many customers.
     */
    data: customersCreateManyInput | customersCreateManyInput[]
  }

  /**
   * customers createManyAndReturn
   */
  export type customersCreateManyAndReturnArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the customers
     */
    select?: customersSelectCreateManyAndReturn<ExtArgs> | null
    /**
     * The data used to create many customers.
     */
    data: customersCreateManyInput | customersCreateManyInput[]
  }

  /**
   * customers update
   */
  export type customersUpdateArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the customers
     */
    select?: customersSelect<ExtArgs> | null
    /**
     * The data needed to update a customers.
     */
    data: XOR<customersUpdateInput, customersUncheckedUpdateInput>
    /**
     * Choose, which customers to update.
     */
    where: customersWhereUniqueInput
  }

  /**
   * customers updateMany
   */
  export type customersUpdateManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * The data used to update customers.
     */
    data: XOR<customersUpdateManyMutationInput, customersUncheckedUpdateManyInput>
    /**
     * Filter which customers to update
     */
    where?: customersWhereInput
  }

  /**
   * customers upsert
   */
  export type customersUpsertArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the customers
     */
    select?: customersSelect<ExtArgs> | null
    /**
     * The filter to search for the customers to update in case it exists.
     */
    where: customersWhereUniqueInput
    /**
     * In case the customers found by the `where` argument doesn't exist, create a new customers with this data.
     */
    create: XOR<customersCreateInput, customersUncheckedCreateInput>
    /**
     * In case the customers was found with the provided `where` argument, update it with this data.
     */
    update: XOR<customersUpdateInput, customersUncheckedUpdateInput>
  }

  /**
   * customers delete
   */
  export type customersDeleteArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the customers
     */
    select?: customersSelect<ExtArgs> | null
    /**
     * Filter which customers to delete.
     */
    where: customersWhereUniqueInput
  }

  /**
   * customers deleteMany
   */
  export type customersDeleteManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Filter which customers to delete
     */
    where?: customersWhereInput
  }

  /**
   * customers without action
   */
  export type customersDefaultArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the customers
     */
    select?: customersSelect<ExtArgs> | null
  }


  /**
   * Enums
   */

  export const TransactionIsolationLevel: {
    Serializable: 'Serializable'
  };

  export type TransactionIsolationLevel = (typeof TransactionIsolationLevel)[keyof typeof TransactionIsolationLevel]


  export const OptionsScalarFieldEnum: {
    id: 'id',
    group: 'group',
    key: 'key',
    value: 'value',
    is_serialize: 'is_serialize'
  };

  export type OptionsScalarFieldEnum = (typeof OptionsScalarFieldEnum)[keyof typeof OptionsScalarFieldEnum]


  export const DevicesScalarFieldEnum: {
    id: 'id',
    name: 'name',
    phone: 'phone',
    description: 'description',
    is_default: 'is_default',
    ip: 'ip'
  };

  export type DevicesScalarFieldEnum = (typeof DevicesScalarFieldEnum)[keyof typeof DevicesScalarFieldEnum]


  export const CustomersScalarFieldEnum: {
    id: 'id',
    firstname: 'firstname',
    lastname: 'lastname',
    phone_number: 'phone_number',
    has_call: 'has_call',
    has_sms: 'has_sms'
  };

  export type CustomersScalarFieldEnum = (typeof CustomersScalarFieldEnum)[keyof typeof CustomersScalarFieldEnum]


  export const SortOrder: {
    asc: 'asc',
    desc: 'desc'
  };

  export type SortOrder = (typeof SortOrder)[keyof typeof SortOrder]


  /**
   * Field references 
   */


  /**
   * Reference to a field of type 'Int'
   */
  export type IntFieldRefInput<$PrismaModel> = FieldRefInputType<$PrismaModel, 'Int'>
    


  /**
   * Reference to a field of type 'String'
   */
  export type StringFieldRefInput<$PrismaModel> = FieldRefInputType<$PrismaModel, 'String'>
    


  /**
   * Reference to a field of type 'Boolean'
   */
  export type BooleanFieldRefInput<$PrismaModel> = FieldRefInputType<$PrismaModel, 'Boolean'>
    


  /**
   * Reference to a field of type 'Float'
   */
  export type FloatFieldRefInput<$PrismaModel> = FieldRefInputType<$PrismaModel, 'Float'>
    
  /**
   * Deep Input Types
   */


  export type optionsWhereInput = {
    AND?: optionsWhereInput | optionsWhereInput[]
    OR?: optionsWhereInput[]
    NOT?: optionsWhereInput | optionsWhereInput[]
    id?: IntFilter<"options"> | number
    group?: StringFilter<"options"> | string
    key?: StringFilter<"options"> | string
    value?: StringFilter<"options"> | string
    is_serialize?: BoolFilter<"options"> | boolean
  }

  export type optionsOrderByWithRelationInput = {
    id?: SortOrder
    group?: SortOrder
    key?: SortOrder
    value?: SortOrder
    is_serialize?: SortOrder
  }

  export type optionsWhereUniqueInput = Prisma.AtLeast<{
    id?: number
    AND?: optionsWhereInput | optionsWhereInput[]
    OR?: optionsWhereInput[]
    NOT?: optionsWhereInput | optionsWhereInput[]
    group?: StringFilter<"options"> | string
    key?: StringFilter<"options"> | string
    value?: StringFilter<"options"> | string
    is_serialize?: BoolFilter<"options"> | boolean
  }, "id">

  export type optionsOrderByWithAggregationInput = {
    id?: SortOrder
    group?: SortOrder
    key?: SortOrder
    value?: SortOrder
    is_serialize?: SortOrder
    _count?: optionsCountOrderByAggregateInput
    _avg?: optionsAvgOrderByAggregateInput
    _max?: optionsMaxOrderByAggregateInput
    _min?: optionsMinOrderByAggregateInput
    _sum?: optionsSumOrderByAggregateInput
  }

  export type optionsScalarWhereWithAggregatesInput = {
    AND?: optionsScalarWhereWithAggregatesInput | optionsScalarWhereWithAggregatesInput[]
    OR?: optionsScalarWhereWithAggregatesInput[]
    NOT?: optionsScalarWhereWithAggregatesInput | optionsScalarWhereWithAggregatesInput[]
    id?: IntWithAggregatesFilter<"options"> | number
    group?: StringWithAggregatesFilter<"options"> | string
    key?: StringWithAggregatesFilter<"options"> | string
    value?: StringWithAggregatesFilter<"options"> | string
    is_serialize?: BoolWithAggregatesFilter<"options"> | boolean
  }

  export type devicesWhereInput = {
    AND?: devicesWhereInput | devicesWhereInput[]
    OR?: devicesWhereInput[]
    NOT?: devicesWhereInput | devicesWhereInput[]
    id?: IntFilter<"devices"> | number
    name?: StringFilter<"devices"> | string
    phone?: StringFilter<"devices"> | string
    description?: StringFilter<"devices"> | string
    is_default?: BoolFilter<"devices"> | boolean
    ip?: StringFilter<"devices"> | string
  }

  export type devicesOrderByWithRelationInput = {
    id?: SortOrder
    name?: SortOrder
    phone?: SortOrder
    description?: SortOrder
    is_default?: SortOrder
    ip?: SortOrder
  }

  export type devicesWhereUniqueInput = Prisma.AtLeast<{
    id?: number
    AND?: devicesWhereInput | devicesWhereInput[]
    OR?: devicesWhereInput[]
    NOT?: devicesWhereInput | devicesWhereInput[]
    name?: StringFilter<"devices"> | string
    phone?: StringFilter<"devices"> | string
    description?: StringFilter<"devices"> | string
    is_default?: BoolFilter<"devices"> | boolean
    ip?: StringFilter<"devices"> | string
  }, "id">

  export type devicesOrderByWithAggregationInput = {
    id?: SortOrder
    name?: SortOrder
    phone?: SortOrder
    description?: SortOrder
    is_default?: SortOrder
    ip?: SortOrder
    _count?: devicesCountOrderByAggregateInput
    _avg?: devicesAvgOrderByAggregateInput
    _max?: devicesMaxOrderByAggregateInput
    _min?: devicesMinOrderByAggregateInput
    _sum?: devicesSumOrderByAggregateInput
  }

  export type devicesScalarWhereWithAggregatesInput = {
    AND?: devicesScalarWhereWithAggregatesInput | devicesScalarWhereWithAggregatesInput[]
    OR?: devicesScalarWhereWithAggregatesInput[]
    NOT?: devicesScalarWhereWithAggregatesInput | devicesScalarWhereWithAggregatesInput[]
    id?: IntWithAggregatesFilter<"devices"> | number
    name?: StringWithAggregatesFilter<"devices"> | string
    phone?: StringWithAggregatesFilter<"devices"> | string
    description?: StringWithAggregatesFilter<"devices"> | string
    is_default?: BoolWithAggregatesFilter<"devices"> | boolean
    ip?: StringWithAggregatesFilter<"devices"> | string
  }

  export type customersWhereInput = {
    AND?: customersWhereInput | customersWhereInput[]
    OR?: customersWhereInput[]
    NOT?: customersWhereInput | customersWhereInput[]
    id?: IntFilter<"customers"> | number
    firstname?: StringFilter<"customers"> | string
    lastname?: StringFilter<"customers"> | string
    phone_number?: StringFilter<"customers"> | string
    has_call?: BoolFilter<"customers"> | boolean
    has_sms?: BoolFilter<"customers"> | boolean
  }

  export type customersOrderByWithRelationInput = {
    id?: SortOrder
    firstname?: SortOrder
    lastname?: SortOrder
    phone_number?: SortOrder
    has_call?: SortOrder
    has_sms?: SortOrder
  }

  export type customersWhereUniqueInput = Prisma.AtLeast<{
    id?: number
    AND?: customersWhereInput | customersWhereInput[]
    OR?: customersWhereInput[]
    NOT?: customersWhereInput | customersWhereInput[]
    firstname?: StringFilter<"customers"> | string
    lastname?: StringFilter<"customers"> | string
    phone_number?: StringFilter<"customers"> | string
    has_call?: BoolFilter<"customers"> | boolean
    has_sms?: BoolFilter<"customers"> | boolean
  }, "id">

  export type customersOrderByWithAggregationInput = {
    id?: SortOrder
    firstname?: SortOrder
    lastname?: SortOrder
    phone_number?: SortOrder
    has_call?: SortOrder
    has_sms?: SortOrder
    _count?: customersCountOrderByAggregateInput
    _avg?: customersAvgOrderByAggregateInput
    _max?: customersMaxOrderByAggregateInput
    _min?: customersMinOrderByAggregateInput
    _sum?: customersSumOrderByAggregateInput
  }

  export type customersScalarWhereWithAggregatesInput = {
    AND?: customersScalarWhereWithAggregatesInput | customersScalarWhereWithAggregatesInput[]
    OR?: customersScalarWhereWithAggregatesInput[]
    NOT?: customersScalarWhereWithAggregatesInput | customersScalarWhereWithAggregatesInput[]
    id?: IntWithAggregatesFilter<"customers"> | number
    firstname?: StringWithAggregatesFilter<"customers"> | string
    lastname?: StringWithAggregatesFilter<"customers"> | string
    phone_number?: StringWithAggregatesFilter<"customers"> | string
    has_call?: BoolWithAggregatesFilter<"customers"> | boolean
    has_sms?: BoolWithAggregatesFilter<"customers"> | boolean
  }

  export type optionsCreateInput = {
    group: string
    key: string
    value: string
    is_serialize?: boolean
  }

  export type optionsUncheckedCreateInput = {
    id?: number
    group: string
    key: string
    value: string
    is_serialize?: boolean
  }

  export type optionsUpdateInput = {
    group?: StringFieldUpdateOperationsInput | string
    key?: StringFieldUpdateOperationsInput | string
    value?: StringFieldUpdateOperationsInput | string
    is_serialize?: BoolFieldUpdateOperationsInput | boolean
  }

  export type optionsUncheckedUpdateInput = {
    id?: IntFieldUpdateOperationsInput | number
    group?: StringFieldUpdateOperationsInput | string
    key?: StringFieldUpdateOperationsInput | string
    value?: StringFieldUpdateOperationsInput | string
    is_serialize?: BoolFieldUpdateOperationsInput | boolean
  }

  export type optionsCreateManyInput = {
    id?: number
    group: string
    key: string
    value: string
    is_serialize?: boolean
  }

  export type optionsUpdateManyMutationInput = {
    group?: StringFieldUpdateOperationsInput | string
    key?: StringFieldUpdateOperationsInput | string
    value?: StringFieldUpdateOperationsInput | string
    is_serialize?: BoolFieldUpdateOperationsInput | boolean
  }

  export type optionsUncheckedUpdateManyInput = {
    id?: IntFieldUpdateOperationsInput | number
    group?: StringFieldUpdateOperationsInput | string
    key?: StringFieldUpdateOperationsInput | string
    value?: StringFieldUpdateOperationsInput | string
    is_serialize?: BoolFieldUpdateOperationsInput | boolean
  }

  export type devicesCreateInput = {
    name: string
    phone: string
    description: string
    is_default: boolean
    ip: string
  }

  export type devicesUncheckedCreateInput = {
    id?: number
    name: string
    phone: string
    description: string
    is_default: boolean
    ip: string
  }

  export type devicesUpdateInput = {
    name?: StringFieldUpdateOperationsInput | string
    phone?: StringFieldUpdateOperationsInput | string
    description?: StringFieldUpdateOperationsInput | string
    is_default?: BoolFieldUpdateOperationsInput | boolean
    ip?: StringFieldUpdateOperationsInput | string
  }

  export type devicesUncheckedUpdateInput = {
    id?: IntFieldUpdateOperationsInput | number
    name?: StringFieldUpdateOperationsInput | string
    phone?: StringFieldUpdateOperationsInput | string
    description?: StringFieldUpdateOperationsInput | string
    is_default?: BoolFieldUpdateOperationsInput | boolean
    ip?: StringFieldUpdateOperationsInput | string
  }

  export type devicesCreateManyInput = {
    id?: number
    name: string
    phone: string
    description: string
    is_default: boolean
    ip: string
  }

  export type devicesUpdateManyMutationInput = {
    name?: StringFieldUpdateOperationsInput | string
    phone?: StringFieldUpdateOperationsInput | string
    description?: StringFieldUpdateOperationsInput | string
    is_default?: BoolFieldUpdateOperationsInput | boolean
    ip?: StringFieldUpdateOperationsInput | string
  }

  export type devicesUncheckedUpdateManyInput = {
    id?: IntFieldUpdateOperationsInput | number
    name?: StringFieldUpdateOperationsInput | string
    phone?: StringFieldUpdateOperationsInput | string
    description?: StringFieldUpdateOperationsInput | string
    is_default?: BoolFieldUpdateOperationsInput | boolean
    ip?: StringFieldUpdateOperationsInput | string
  }

  export type customersCreateInput = {
    firstname: string
    lastname: string
    phone_number: string
    has_call: boolean
    has_sms: boolean
  }

  export type customersUncheckedCreateInput = {
    id?: number
    firstname: string
    lastname: string
    phone_number: string
    has_call: boolean
    has_sms: boolean
  }

  export type customersUpdateInput = {
    firstname?: StringFieldUpdateOperationsInput | string
    lastname?: StringFieldUpdateOperationsInput | string
    phone_number?: StringFieldUpdateOperationsInput | string
    has_call?: BoolFieldUpdateOperationsInput | boolean
    has_sms?: BoolFieldUpdateOperationsInput | boolean
  }

  export type customersUncheckedUpdateInput = {
    id?: IntFieldUpdateOperationsInput | number
    firstname?: StringFieldUpdateOperationsInput | string
    lastname?: StringFieldUpdateOperationsInput | string
    phone_number?: StringFieldUpdateOperationsInput | string
    has_call?: BoolFieldUpdateOperationsInput | boolean
    has_sms?: BoolFieldUpdateOperationsInput | boolean
  }

  export type customersCreateManyInput = {
    id?: number
    firstname: string
    lastname: string
    phone_number: string
    has_call: boolean
    has_sms: boolean
  }

  export type customersUpdateManyMutationInput = {
    firstname?: StringFieldUpdateOperationsInput | string
    lastname?: StringFieldUpdateOperationsInput | string
    phone_number?: StringFieldUpdateOperationsInput | string
    has_call?: BoolFieldUpdateOperationsInput | boolean
    has_sms?: BoolFieldUpdateOperationsInput | boolean
  }

  export type customersUncheckedUpdateManyInput = {
    id?: IntFieldUpdateOperationsInput | number
    firstname?: StringFieldUpdateOperationsInput | string
    lastname?: StringFieldUpdateOperationsInput | string
    phone_number?: StringFieldUpdateOperationsInput | string
    has_call?: BoolFieldUpdateOperationsInput | boolean
    has_sms?: BoolFieldUpdateOperationsInput | boolean
  }

  export type IntFilter<$PrismaModel = never> = {
    equals?: number | IntFieldRefInput<$PrismaModel>
    in?: number[]
    notIn?: number[]
    lt?: number | IntFieldRefInput<$PrismaModel>
    lte?: number | IntFieldRefInput<$PrismaModel>
    gt?: number | IntFieldRefInput<$PrismaModel>
    gte?: number | IntFieldRefInput<$PrismaModel>
    not?: NestedIntFilter<$PrismaModel> | number
  }

  export type StringFilter<$PrismaModel = never> = {
    equals?: string | StringFieldRefInput<$PrismaModel>
    in?: string[]
    notIn?: string[]
    lt?: string | StringFieldRefInput<$PrismaModel>
    lte?: string | StringFieldRefInput<$PrismaModel>
    gt?: string | StringFieldRefInput<$PrismaModel>
    gte?: string | StringFieldRefInput<$PrismaModel>
    contains?: string | StringFieldRefInput<$PrismaModel>
    startsWith?: string | StringFieldRefInput<$PrismaModel>
    endsWith?: string | StringFieldRefInput<$PrismaModel>
    not?: NestedStringFilter<$PrismaModel> | string
  }

  export type BoolFilter<$PrismaModel = never> = {
    equals?: boolean | BooleanFieldRefInput<$PrismaModel>
    not?: NestedBoolFilter<$PrismaModel> | boolean
  }

  export type optionsCountOrderByAggregateInput = {
    id?: SortOrder
    group?: SortOrder
    key?: SortOrder
    value?: SortOrder
    is_serialize?: SortOrder
  }

  export type optionsAvgOrderByAggregateInput = {
    id?: SortOrder
  }

  export type optionsMaxOrderByAggregateInput = {
    id?: SortOrder
    group?: SortOrder
    key?: SortOrder
    value?: SortOrder
    is_serialize?: SortOrder
  }

  export type optionsMinOrderByAggregateInput = {
    id?: SortOrder
    group?: SortOrder
    key?: SortOrder
    value?: SortOrder
    is_serialize?: SortOrder
  }

  export type optionsSumOrderByAggregateInput = {
    id?: SortOrder
  }

  export type IntWithAggregatesFilter<$PrismaModel = never> = {
    equals?: number | IntFieldRefInput<$PrismaModel>
    in?: number[]
    notIn?: number[]
    lt?: number | IntFieldRefInput<$PrismaModel>
    lte?: number | IntFieldRefInput<$PrismaModel>
    gt?: number | IntFieldRefInput<$PrismaModel>
    gte?: number | IntFieldRefInput<$PrismaModel>
    not?: NestedIntWithAggregatesFilter<$PrismaModel> | number
    _count?: NestedIntFilter<$PrismaModel>
    _avg?: NestedFloatFilter<$PrismaModel>
    _sum?: NestedIntFilter<$PrismaModel>
    _min?: NestedIntFilter<$PrismaModel>
    _max?: NestedIntFilter<$PrismaModel>
  }

  export type StringWithAggregatesFilter<$PrismaModel = never> = {
    equals?: string | StringFieldRefInput<$PrismaModel>
    in?: string[]
    notIn?: string[]
    lt?: string | StringFieldRefInput<$PrismaModel>
    lte?: string | StringFieldRefInput<$PrismaModel>
    gt?: string | StringFieldRefInput<$PrismaModel>
    gte?: string | StringFieldRefInput<$PrismaModel>
    contains?: string | StringFieldRefInput<$PrismaModel>
    startsWith?: string | StringFieldRefInput<$PrismaModel>
    endsWith?: string | StringFieldRefInput<$PrismaModel>
    not?: NestedStringWithAggregatesFilter<$PrismaModel> | string
    _count?: NestedIntFilter<$PrismaModel>
    _min?: NestedStringFilter<$PrismaModel>
    _max?: NestedStringFilter<$PrismaModel>
  }

  export type BoolWithAggregatesFilter<$PrismaModel = never> = {
    equals?: boolean | BooleanFieldRefInput<$PrismaModel>
    not?: NestedBoolWithAggregatesFilter<$PrismaModel> | boolean
    _count?: NestedIntFilter<$PrismaModel>
    _min?: NestedBoolFilter<$PrismaModel>
    _max?: NestedBoolFilter<$PrismaModel>
  }

  export type devicesCountOrderByAggregateInput = {
    id?: SortOrder
    name?: SortOrder
    phone?: SortOrder
    description?: SortOrder
    is_default?: SortOrder
    ip?: SortOrder
  }

  export type devicesAvgOrderByAggregateInput = {
    id?: SortOrder
  }

  export type devicesMaxOrderByAggregateInput = {
    id?: SortOrder
    name?: SortOrder
    phone?: SortOrder
    description?: SortOrder
    is_default?: SortOrder
    ip?: SortOrder
  }

  export type devicesMinOrderByAggregateInput = {
    id?: SortOrder
    name?: SortOrder
    phone?: SortOrder
    description?: SortOrder
    is_default?: SortOrder
    ip?: SortOrder
  }

  export type devicesSumOrderByAggregateInput = {
    id?: SortOrder
  }

  export type customersCountOrderByAggregateInput = {
    id?: SortOrder
    firstname?: SortOrder
    lastname?: SortOrder
    phone_number?: SortOrder
    has_call?: SortOrder
    has_sms?: SortOrder
  }

  export type customersAvgOrderByAggregateInput = {
    id?: SortOrder
  }

  export type customersMaxOrderByAggregateInput = {
    id?: SortOrder
    firstname?: SortOrder
    lastname?: SortOrder
    phone_number?: SortOrder
    has_call?: SortOrder
    has_sms?: SortOrder
  }

  export type customersMinOrderByAggregateInput = {
    id?: SortOrder
    firstname?: SortOrder
    lastname?: SortOrder
    phone_number?: SortOrder
    has_call?: SortOrder
    has_sms?: SortOrder
  }

  export type customersSumOrderByAggregateInput = {
    id?: SortOrder
  }

  export type StringFieldUpdateOperationsInput = {
    set?: string
  }

  export type BoolFieldUpdateOperationsInput = {
    set?: boolean
  }

  export type IntFieldUpdateOperationsInput = {
    set?: number
    increment?: number
    decrement?: number
    multiply?: number
    divide?: number
  }

  export type NestedIntFilter<$PrismaModel = never> = {
    equals?: number | IntFieldRefInput<$PrismaModel>
    in?: number[]
    notIn?: number[]
    lt?: number | IntFieldRefInput<$PrismaModel>
    lte?: number | IntFieldRefInput<$PrismaModel>
    gt?: number | IntFieldRefInput<$PrismaModel>
    gte?: number | IntFieldRefInput<$PrismaModel>
    not?: NestedIntFilter<$PrismaModel> | number
  }

  export type NestedStringFilter<$PrismaModel = never> = {
    equals?: string | StringFieldRefInput<$PrismaModel>
    in?: string[]
    notIn?: string[]
    lt?: string | StringFieldRefInput<$PrismaModel>
    lte?: string | StringFieldRefInput<$PrismaModel>
    gt?: string | StringFieldRefInput<$PrismaModel>
    gte?: string | StringFieldRefInput<$PrismaModel>
    contains?: string | StringFieldRefInput<$PrismaModel>
    startsWith?: string | StringFieldRefInput<$PrismaModel>
    endsWith?: string | StringFieldRefInput<$PrismaModel>
    not?: NestedStringFilter<$PrismaModel> | string
  }

  export type NestedBoolFilter<$PrismaModel = never> = {
    equals?: boolean | BooleanFieldRefInput<$PrismaModel>
    not?: NestedBoolFilter<$PrismaModel> | boolean
  }

  export type NestedIntWithAggregatesFilter<$PrismaModel = never> = {
    equals?: number | IntFieldRefInput<$PrismaModel>
    in?: number[]
    notIn?: number[]
    lt?: number | IntFieldRefInput<$PrismaModel>
    lte?: number | IntFieldRefInput<$PrismaModel>
    gt?: number | IntFieldRefInput<$PrismaModel>
    gte?: number | IntFieldRefInput<$PrismaModel>
    not?: NestedIntWithAggregatesFilter<$PrismaModel> | number
    _count?: NestedIntFilter<$PrismaModel>
    _avg?: NestedFloatFilter<$PrismaModel>
    _sum?: NestedIntFilter<$PrismaModel>
    _min?: NestedIntFilter<$PrismaModel>
    _max?: NestedIntFilter<$PrismaModel>
  }

  export type NestedFloatFilter<$PrismaModel = never> = {
    equals?: number | FloatFieldRefInput<$PrismaModel>
    in?: number[]
    notIn?: number[]
    lt?: number | FloatFieldRefInput<$PrismaModel>
    lte?: number | FloatFieldRefInput<$PrismaModel>
    gt?: number | FloatFieldRefInput<$PrismaModel>
    gte?: number | FloatFieldRefInput<$PrismaModel>
    not?: NestedFloatFilter<$PrismaModel> | number
  }

  export type NestedStringWithAggregatesFilter<$PrismaModel = never> = {
    equals?: string | StringFieldRefInput<$PrismaModel>
    in?: string[]
    notIn?: string[]
    lt?: string | StringFieldRefInput<$PrismaModel>
    lte?: string | StringFieldRefInput<$PrismaModel>
    gt?: string | StringFieldRefInput<$PrismaModel>
    gte?: string | StringFieldRefInput<$PrismaModel>
    contains?: string | StringFieldRefInput<$PrismaModel>
    startsWith?: string | StringFieldRefInput<$PrismaModel>
    endsWith?: string | StringFieldRefInput<$PrismaModel>
    not?: NestedStringWithAggregatesFilter<$PrismaModel> | string
    _count?: NestedIntFilter<$PrismaModel>
    _min?: NestedStringFilter<$PrismaModel>
    _max?: NestedStringFilter<$PrismaModel>
  }

  export type NestedBoolWithAggregatesFilter<$PrismaModel = never> = {
    equals?: boolean | BooleanFieldRefInput<$PrismaModel>
    not?: NestedBoolWithAggregatesFilter<$PrismaModel> | boolean
    _count?: NestedIntFilter<$PrismaModel>
    _min?: NestedBoolFilter<$PrismaModel>
    _max?: NestedBoolFilter<$PrismaModel>
  }



  /**
   * Batch Payload for updateMany & deleteMany & createMany
   */

  export type BatchPayload = {
    count: number
  }

  /**
   * DMMF
   */
  export const dmmf: runtime.BaseDMMF
}