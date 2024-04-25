import axios from 'axios'

// 创建axios实例
const service = axios.create({
    // axios中请求配置有baseURL选项，表示请求URL公共部分
    baseURL: process.env.VUE_APP_BASE_API,
    // 超时时间
    timeout: 10000
})

/**
 * request拦截器
 */
service.interceptors.request.use(config => {

    console.log('request.config', config)

    return config
}, error => {
    console.log(error)
    Promise.reject(error)
})


/**
 * 响应拦截器
 */
service.interceptors.response.use(res => {
        console.log('response.res', res)
        return res.data
    }, error => {
        console.log('err' + error)
        return Promise.reject(error)
    }
)

export default service
