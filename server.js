import Fastify from 'fastify';

const fastify = Fastify({ logger: true })

// ヘッダー認証の追加
fastify.addHook('onRequest' async (request, reply) => {
  const apikey = request.headers['x-api-key']

  if (apikey !== '123' ) {
    reply.code(401).send({error: 'アクセス許可がありません'})
  }
})

// 認証が通ればここに
fastify.get('/', async function handler (request, reply){
  return { message: 'Dockerテスト-ヘッダー認証通過' };
})

try {
  await fastify.listen({ port: 3000, host: '0.0.0.0'  })
} catch (err) {
  fastify.log.error(err)
  process.exit(1)
}
