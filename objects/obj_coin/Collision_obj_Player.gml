// Add to the player's coin count
global.coins += 100;

// Optional: Play a sound effect
// audio_play_sound(snd_coin_pickup, 1, false);

// Destroy the coin instance
instance_destroy();