package com.meli.sdui.testapp.ui.login

import android.app.Activity
import android.os.Bundle
import android.widget.Toast
import androidx.activity.result.contract.ActivityResultContracts
import androidx.appcompat.app.AppCompatActivity
import com.meli.sdui.flutterandroid.EmbeddingFlutterActivity
import com.meli.sdui.testapp.databinding.ActivityLoginBinding

class LoginActivity : AppCompatActivity() {

    private lateinit var binding: ActivityLoginBinding

    private var resultLauncher = registerForActivityResult(ActivityResultContracts.StartActivityForResult()) { result ->
        if (result.resultCode == Activity.RESULT_OK) {
            val response = result.data?.getStringExtra("data");
            Toast.makeText(this, "Result OK: $response", Toast.LENGTH_LONG).show()
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        binding = ActivityLoginBinding.inflate(layoutInflater)
        setContentView(binding.root)

        val username = binding.username
        val login = binding.login


        login.setOnClickListener {
            if (username.text.isNotEmpty()){
                startFlutterModule(username.text.toString())
            }
        }
    }

    private fun startFlutterModule(username: String) {
        val route = "/home?user=$username"
        resultLauncher.launch(
            EmbeddingFlutterActivity.createIntent(this, route)
        )
    }

}
