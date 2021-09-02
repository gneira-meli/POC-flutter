package com.meli.sdui.testapp

import android.app.Activity
import android.os.Bundle
import android.widget.Toast
import androidx.activity.result.contract.ActivityResultContracts
import androidx.appcompat.app.AppCompatActivity
import com.meli.sdui.flutterandroid.EmbeddingFlutterActivity
import com.meli.sdui.flutterandroid.EmbeddingFlutterFragment
import com.meli.sdui.testapp.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {

    private lateinit var binding: ActivityMainBinding

    private var resultLauncher = registerForActivityResult(ActivityResultContracts.StartActivityForResult()) { result ->
        if (result.resultCode == Activity.RESULT_OK) {
            val response = result.data?.getStringExtra("data");
            Toast.makeText(this, "Result OK: $response", Toast.LENGTH_LONG).show()
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        val username = binding.username

        binding.startActivity.setOnClickListener {
            if (username.text.isNotEmpty()){
                startFlutterModuleActivity(username.text.toString())
            }
        }

        binding.startFragment.setOnClickListener {
            if (username.text.isNotEmpty()){
                startFlutterModuleFragment(username.text.toString())
            }
        }
    }

    private fun startFlutterModuleActivity(username: String) {
        val route = "/home?user=$username"
        val intent = EmbeddingFlutterActivity.createIntent(this, route)
        resultLauncher.launch(intent)
    }

    private fun startFlutterModuleFragment(username: String) {
        val route = "/home?user=$username"
        val fragment = EmbeddingFlutterFragment.createInstance(route)
        supportFragmentManager.beginTransaction().add(
            R.id.fragment_container_view,
            fragment).commit()
    }

}
