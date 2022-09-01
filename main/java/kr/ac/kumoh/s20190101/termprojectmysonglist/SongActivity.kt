package kr.ac.kumoh.s20190101.termprojectmysonglist

import android.os.Bundle
import android.os.PersistableBundle
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.AndroidViewModel
import androidx.lifecycle.ViewModelProvider
import kr.ac.kumoh.s20190101.termprojectmysonglist.databinding.ActivitySongBinding
import java.net.URLEncoder

class SongActivity : AppCompatActivity(){
    private lateinit var layout: ActivitySongBinding
    private lateinit var songVM: SongViewModel

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        layout = ActivitySongBinding.inflate(layoutInflater)
        setContentView(layout.root)

        songVM = ViewModelProvider(this).get(SongViewModel::class.java)
        layout.title.text = intent.getStringExtra("title")
        val url = "${SongViewModel.SERVER_URL}/image/" + URLEncoder.encode(intent.getStringExtra("image"), "utf-8")
        layout.cover.setImageUrl(url, (songVM).getImageLoader())
        layout.memo.text = intent.getStringExtra("memo")
    }
}