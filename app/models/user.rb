class User < ActiveRecord::Base
  has_many :authors
  has_many :articles, through: :authors

  has_many :group_members
  has_many :groups, through: :group_members

  default_scope { where(active: true) }

  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :password
  validates_presence_of :groups

  def permissions
    all_permissions = groups.map(&:permissions)
    if all_permissions.length > 1
      permissions = all_permissions.inject({}) do |result, group_permissions|
        group_permissions.each do |group, permissions|
          result[group] ||= {}
          permissions.each do |permission, value|
            if !result[group][permission] || (result[group][permission] && result[group][permission] != "1" && value == "1")
              result[group][permission] = value
            end
          end
        end

        result
      end

      permissions
    else
      all_permissions.first
    end
  end

  def can?(permission)
    perms = permissions
    group, perm = permission.split('.')

    perms[group] && perms[group]['can_' + perm] == "1"
  end

  def cannot?(permission)
    perms = permissions
    group, perm = permission.split('.')

    perms[group] && perms[group]['can_' + perm] == "0"
  end
end
