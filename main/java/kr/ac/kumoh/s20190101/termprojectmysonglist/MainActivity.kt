package kr.ac.kumoh.s20190101.termprojectmysonglist

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProvider
import androidx.recyclerview.widget.DefaultItemAnimator
import androidx.recyclerview.widget.LinearLayoutManager
import kr.ac.kumoh.s20190101.termprojectmysonglist.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {
    private lateinit var model: SongViewModel
    private lateinit var view: ActivityMainBinding
    private lateinit var mAdapter: SongAdapter

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        view = ActivityMainBinding.inflate(layoutInflater)
        setContentView(view.root)

        model = ViewModelProvider(this).get(SongViewModel::class.java)
        mAdapter = SongAdapter(model) { review -> adapterOnClick(review)}

        view.list.apply {
            layoutManager = LinearLayoutManager(applicationContext)
            setHasFixedSize(true)
            itemAnimator = DefaultItemAnimator()
            adapter = mAdapter
        }

        model.getLiveData().observe(this,
            Observer<ArrayList<SongViewModel.Song>> {
                mAdapter.notifyDataSetChanged()
            })
        model.getReviews()
    }

    private fun adapterOnClick(review: SongViewModel.Song) {
        val intent = Intent(this, SongActivity::class.java)
        intent.putExtra("title", review.title)
        intent.putExtra("image", review.image)
        intent.putExtra("memo", review.memo)
        startActivity(intent)
    }
}