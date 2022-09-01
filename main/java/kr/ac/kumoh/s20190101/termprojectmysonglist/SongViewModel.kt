package kr.ac.kumoh.s20190101.termprojectmysonglist

import android.app.Application
import android.graphics.Bitmap
import android.widget.Toast
import androidx.collection.LruCache
import androidx.lifecycle.AndroidViewModel
import androidx.lifecycle.MutableLiveData
import com.android.volley.Request
import com.android.volley.RequestQueue
import com.android.volley.toolbox.ImageLoader
import com.android.volley.toolbox.JsonArrayRequest
import com.android.volley.toolbox.Volley
import org.json.JSONArray
import org.json.JSONObject
import java.net.URLEncoder

class SongViewModel(application: Application) :
    AndroidViewModel(application) {
    companion object {
        const val QUEUE_TAG = "SongVolleyRequest"
        const val SERVER_URL = "https://termdb--bnkrf.run.goorm.io/"
    }

    data class Song(var id: Int, var title: String, var singer: String, var image: String, var memo: String)
    val list = MutableLiveData<ArrayList<Song>>()
    private val song = ArrayList<Song>()

    private var queue = VolleySingleton.getInstance(application).requestQueue
    private val loader = VolleySingleton.getInstance(application).imageLoader
//    val imageLoader: ImageLoader

    init {
        list.value = song
//        queue = Volley.newRequestQueue(application)
//
//        imageLoader = ImageLoader(queue,
//            object : ImageLoader.ImageCache {
//                private val cache = LruCache<String, Bitmap>(100)
//                override fun getBitmap(url: String): Bitmap? {
//                    return cache.get(url)
//                }
//                override fun putBitmap(url: String, bitmap: Bitmap) {
//                    cache.put(url, bitmap)
//                }
//            })
    }

    fun getLiveData() = list
    fun getImageLoader() = loader
    fun getImageUrl(i: Int): String = "$SERVER_URL/image/" + URLEncoder.encode(song[i].image, "utf-8")

    fun getSong(i: Int) = song[i]
    fun getSize() = song.size

    fun getReviews() {
        val request = JsonArrayRequest(
            Request.Method.GET,
            "$SERVER_URL/song",
            null,
            {
                song.clear()
                addReviews(it)
                list.value = song
            },
            {
                Toast.makeText(getApplication(),
                    it.toString(),
                    Toast.LENGTH_LONG).show()
            }
        )
        request.tag = QUEUE_TAG
        queue.add(request)
    }

    private fun addReviews(items: JSONArray) {
        for (i in 0 until items.length()) {
            val item: JSONObject = items[i] as JSONObject
            val id = item.getInt("id")
            val title = item.getString("title")
            val singer = item.getString("singer")
            val image = item.getString("image")
            val memo = item.getString("memo")

            song.add(Song(id, title, singer, image, memo))
        }
    }

    override fun onCleared() {
        super.onCleared()
        queue.cancelAll(QUEUE_TAG)
    }
}