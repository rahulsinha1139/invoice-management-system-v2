'use client';

import { useState, useEffect } from 'react';

interface Achievement {
  id: string;
  title: string;
  description: string;
  icon: string;
  category: 'sales' | 'efficiency' | 'customer' | 'system' | 'milestone';
  progress: number;
  target: number;
  completed: boolean;
  unlockedAt?: Date;
  xp: number;
  rarity: 'common' | 'rare' | 'epic' | 'legendary';
}

interface UserStats {
  level: number;
  totalXP: number;
  nextLevelXP: number;
  completedAchievements: number;
  streak: {
    current: number;
    longest: number;
    type: 'daily_invoices' | 'perfect_payments' | 'system_usage';
  };
  badges: string[];
  rank: string;
}

export default function TerminalAchievements() {
  const [userStats, setUserStats] = useState<UserStats | null>(null);
  const [achievements, setAchievements] = useState<Achievement[]>([]);
  const [selectedCategory, setSelectedCategory] = useState<'all' | Achievement['category']>('all');
  const [showCompleted, setShowCompleted] = useState(false);
  const [isLoading, setIsLoading] = useState(true);

  useEffect(() => {
    const loadAchievementSystem = async () => {
      setIsLoading(true);

      // Simulate loading achievements and user progress
      await new Promise(resolve => setTimeout(resolve, 1200));

      const mockUserStats: UserStats = {
        level: 12,
        totalXP: 3450,
        nextLevelXP: 4000,
        completedAchievements: 23,
        streak: {
          current: 7,
          longest: 15,
          type: 'daily_invoices'
        },
        badges: ['Early Adopter', 'Power User', 'Sales Champion', 'Efficiency Master'],
        rank: 'Senior Invoice Commander'
      };

      const mockAchievements: Achievement[] = [
        // Sales Achievements
        {
          id: 'first_invoice',
          title: 'First Steps',
          description: 'Create your first invoice',
          icon: '🏆',
          category: 'sales',
          progress: 1,
          target: 1,
          completed: true,
          unlockedAt: new Date('2024-01-15'),
          xp: 50,
          rarity: 'common'
        },
        {
          id: 'century_maker',
          title: 'Century Maker',
          description: 'Generate 100 invoices',
          icon: '💯',
          category: 'sales',
          progress: 87,
          target: 100,
          completed: false,
          xp: 500,
          rarity: 'rare'
        },
        {
          id: 'million_club',
          title: 'Million Club',
          description: 'Reach ₹10,00,000 in total invoice value',
          icon: '💎',
          category: 'sales',
          progress: 2847629,
          target: 1000000,
          completed: true,
          unlockedAt: new Date('2024-03-20'),
          xp: 1000,
          rarity: 'epic'
        },

        // Efficiency Achievements
        {
          id: 'speed_demon',
          title: 'Speed Demon',
          description: 'Create 5 invoices in under 10 minutes',
          icon: '⚡',
          category: 'efficiency',
          progress: 3,
          target: 5,
          completed: false,
          xp: 200,
          rarity: 'rare'
        },
        {
          id: 'automation_master',
          title: 'Automation Master',
          description: 'Use keyboard shortcuts 50 times',
          icon: '⌨️',
          category: 'efficiency',
          progress: 42,
          target: 50,
          completed: false,
          xp: 300,
          rarity: 'rare'
        },
        {
          id: 'perfect_precision',
          title: 'Perfect Precision',
          description: 'Create 20 invoices with no corrections',
          icon: '🎯',
          category: 'efficiency',
          progress: 20,
          target: 20,
          completed: true,
          unlockedAt: new Date('2024-02-28'),
          xp: 400,
          rarity: 'epic'
        },

        // Customer Achievements
        {
          id: 'customer_favorite',
          title: 'Customer Favorite',
          description: 'Maintain 95%+ customer satisfaction',
          icon: '⭐',
          category: 'customer',
          progress: 97,
          target: 95,
          completed: true,
          unlockedAt: new Date('2024-04-01'),
          xp: 600,
          rarity: 'epic'
        },
        {
          id: 'relationship_builder',
          title: 'Relationship Builder',
          description: 'Add 50 new customers',
          icon: '🤝',
          category: 'customer',
          progress: 35,
          target: 50,
          completed: false,
          xp: 350,
          rarity: 'rare'
        },

        // System Achievements
        {
          id: 'email_intelligence',
          title: 'AI Whisperer',
          description: 'Use Email Intelligence 25 times',
          icon: '🤖',
          category: 'system',
          progress: 18,
          target: 25,
          completed: false,
          xp: 250,
          rarity: 'rare'
        },
        {
          id: 'command_master',
          title: 'Command Master',
          description: 'Use Command Palette 100 times',
          icon: '👨‍💻',
          category: 'system',
          progress: 73,
          target: 100,
          completed: false,
          xp: 300,
          rarity: 'rare'
        },
        {
          id: 'data_explorer',
          title: 'Data Explorer',
          description: 'Export data in 3 different formats',
          icon: '📊',
          category: 'system',
          progress: 2,
          target: 3,
          completed: false,
          xp: 150,
          rarity: 'common'
        },

        // Milestone Achievements
        {
          id: 'early_adopter',
          title: 'Early Adopter',
          description: 'Be among the first 100 users',
          icon: '🌟',
          category: 'milestone',
          progress: 1,
          target: 1,
          completed: true,
          unlockedAt: new Date('2024-01-10'),
          xp: 1000,
          rarity: 'legendary'
        },
        {
          id: 'consistency_king',
          title: 'Consistency King',
          description: 'Use the system for 30 consecutive days',
          icon: '🔥',
          category: 'milestone',
          progress: 23,
          target: 30,
          completed: false,
          xp: 800,
          rarity: 'epic'
        }
      ];

      setUserStats(mockUserStats);
      setAchievements(mockAchievements);
      setIsLoading(false);
    };

    loadAchievementSystem();
  }, []);

  if (isLoading) {
    return (
      <div className="terminal-container min-h-screen">
        <div className="terminal-header">
          <div className="terminal-dots">
            <div className="terminal-dot red"></div>
            <div className="terminal-dot yellow"></div>
            <div className="terminal-dot green"></div>
          </div>
          <div className="terminal-title">ACHIEVEMENT SYSTEM</div>
        </div>

        <div className="p-6 flex items-center justify-center min-h-[400px]">
          <div className="terminal-card max-w-md w-full text-center">
            <div className="p-8">
              <div className="text-4xl mb-4 animate-pulse">🎮</div>
              <div className="terminal-text text-xl mb-2">LOADING ACHIEVEMENTS</div>
              <div className="text-sm text-gray-400 mb-6">Computing your progress...</div>
              <div className="terminal-progress">
                <div className="terminal-progress-bar animate-pulse" style={{ width: '70%' }}></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    );
  }

  if (!userStats) return null;

  const filteredAchievements = achievements.filter(achievement => {
    const categoryMatch = selectedCategory === 'all' || achievement.category === selectedCategory;
    const completionMatch = showCompleted ? achievement.completed : true;
    return categoryMatch && completionMatch;
  });

  const getRarityColor = (rarity: Achievement['rarity']) => {
    switch (rarity) {
      case 'common': return 'text-gray-400 border-gray-500/30';
      case 'rare': return 'text-blue-400 border-blue-500/30';
      case 'epic': return 'text-purple-400 border-purple-500/30';
      case 'legendary': return 'text-yellow-400 border-yellow-500/30';
    }
  };

  const getLevelProgress = () => {
    const currentLevelXP = userStats.totalXP - (userStats.level - 1) * 300;
    const levelXPRange = userStats.nextLevelXP - (userStats.level - 1) * 300;
    return (currentLevelXP / levelXPRange) * 100;
  };

  return (
    <div className="terminal-container min-h-screen">
      <div className="terminal-header">
        <div className="terminal-dots">
          <div className="terminal-dot red"></div>
          <div className="terminal-dot yellow"></div>
          <div className="terminal-dot green"></div>
        </div>
        <div className="terminal-title">🎮 ACHIEVEMENT SYSTEM</div>
        <div className="text-xs text-green-400">
          LEVEL {userStats.level} • {userStats.totalXP} XP
        </div>
      </div>

      <div className="p-6 space-y-6">
        {/* User Stats Card */}
        <div className="terminal-card">
          <div className="terminal-card-header">
            <div className="terminal-card-title">COMMANDER PROFILE</div>
            <div className="text-xs text-yellow-400">{userStats.rank}</div>
          </div>

          <div className="p-4 grid grid-cols-1 md:grid-cols-3 gap-6">
            {/* Level Progress */}
            <div className="space-y-3">
              <div className="flex items-center justify-between">
                <div className="text-sm font-semibold">Level {userStats.level}</div>
                <div className="text-xs text-gray-400">{userStats.totalXP}/{userStats.nextLevelXP} XP</div>
              </div>
              <div className="terminal-progress">
                <div
                  className="terminal-progress-bar"
                  style={{ width: `${getLevelProgress()}%` }}
                ></div>
              </div>
              <div className="text-xs text-gray-400">
                {userStats.nextLevelXP - userStats.totalXP} XP to next level
              </div>
            </div>

            {/* Achievements Summary */}
            <div className="text-center">
              <div className="text-2xl font-bold terminal-text">{userStats.completedAchievements}</div>
              <div className="text-sm text-gray-400">Achievements Unlocked</div>
              <div className="text-xs text-green-400 mt-1">
                {Math.round((userStats.completedAchievements / achievements.length) * 100)}% Complete
              </div>
            </div>

            {/* Current Streak */}
            <div className="text-center">
              <div className="text-2xl font-bold text-orange-400">{userStats.streak.current} 🔥</div>
              <div className="text-sm text-gray-400">Day Streak</div>
              <div className="text-xs text-orange-400 mt-1">
                Best: {userStats.streak.longest} days
              </div>
            </div>
          </div>

          {/* Badges */}
          <div className="px-4 pb-4">
            <div className="text-sm font-semibold mb-2 terminal-text">Earned Badges</div>
            <div className="flex flex-wrap gap-2">
              {userStats.badges.map((badge, index) => (
                <span
                  key={index}
                  className="px-3 py-1 bg-blue-500/20 text-blue-300 text-xs rounded border border-blue-500/30"
                >
                  {badge}
                </span>
              ))}
            </div>
          </div>
        </div>

        {/* Filters */}
        <div className="flex flex-wrap gap-2 items-center">
          <div className="text-sm font-semibold terminal-text mr-4">Filter:</div>

          {(['all', 'sales', 'efficiency', 'customer', 'system', 'milestone'] as const).map((category) => (
            <button
              key={category}
              onClick={() => setSelectedCategory(category)}
              className={`terminal-button text-xs px-3 py-1 ${
                selectedCategory === category ? 'primary' : 'secondary'
              }`}
            >
              {category.toUpperCase()}
            </button>
          ))}

          <button
            onClick={() => setShowCompleted(!showCompleted)}
            className={`terminal-button text-xs px-3 py-1 ml-4 ${
              showCompleted ? 'primary' : 'secondary'
            }`}
          >
            {showCompleted ? 'SHOW ALL' : 'COMPLETED ONLY'}
          </button>
        </div>

        {/* Achievements Grid */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
          {filteredAchievements.map((achievement) => (
            <div
              key={achievement.id}
              className={`terminal-card hover:bg-gray-800 transition-all border-2 ${
                achievement.completed
                  ? `${getRarityColor(achievement.rarity)} bg-gray-800/20`
                  : 'border-gray-700'
              } ${achievement.completed ? 'shadow-lg' : ''}`}
            >
              <div className="p-4">
                {/* Achievement Header */}
                <div className="flex items-center gap-3 mb-3">
                  <div className={`text-2xl ${achievement.completed ? '' : 'grayscale opacity-50'}`}>
                    {achievement.icon}
                  </div>
                  <div className="flex-1">
                    <div className={`font-semibold ${achievement.completed ? 'terminal-text' : 'text-gray-500'}`}>
                      {achievement.title}
                    </div>
                    <div className="text-xs text-gray-400 capitalize">
                      {achievement.rarity} • {achievement.xp} XP
                    </div>
                  </div>
                  {achievement.completed && (
                    <div className="text-green-400">✓</div>
                  )}
                </div>

                {/* Description */}
                <div className="text-sm text-gray-400 mb-3">
                  {achievement.description}
                </div>

                {/* Progress Bar */}
                {!achievement.completed && (
                  <div className="space-y-1">
                    <div className="flex justify-between text-xs">
                      <span>Progress</span>
                      <span>{achievement.progress}/{achievement.target}</span>
                    </div>
                    <div className="terminal-progress">
                      <div
                        className="terminal-progress-bar"
                        style={{
                          width: `${Math.min((achievement.progress / achievement.target) * 100, 100)}%`
                        }}
                      ></div>
                    </div>
                  </div>
                )}

                {/* Completion Date */}
                {achievement.completed && achievement.unlockedAt && (
                  <div className="text-xs text-green-400 mt-2">
                    Unlocked: {achievement.unlockedAt.toLocaleDateString()}
                  </div>
                )}
              </div>
            </div>
          ))}
        </div>

        {filteredAchievements.length === 0 && (
          <div className="text-center py-8">
            <div className="terminal-card inline-block p-8">
              <div className="text-4xl mb-2">🔍</div>
              <div className="terminal-text">No achievements found</div>
              <div className="text-sm text-gray-400 mt-1">
                Try adjusting your filters
              </div>
            </div>
          </div>
        )}

        {/* Quick Stats */}
        <div className="terminal-card">
          <div className="terminal-card-header">
            <div className="terminal-card-title">🏅 LEADERBOARD POSITION</div>
          </div>
          <div className="p-4 grid grid-cols-1 md:grid-cols-4 gap-4 text-center">
            <div>
              <div className="text-xl font-bold text-yellow-400">#3</div>
              <div className="text-xs text-gray-400">Overall Ranking</div>
            </div>
            <div>
              <div className="text-xl font-bold text-green-400">#1</div>
              <div className="text-xs text-gray-400">Monthly Sales</div>
            </div>
            <div>
              <div className="text-xl font-bold text-blue-400">#2</div>
              <div className="text-xs text-gray-400">Efficiency Score</div>
            </div>
            <div>
              <div className="text-xl font-bold text-purple-400">#5</div>
              <div className="text-xs text-gray-400">System Usage</div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}